#!/usr/bin/env bash

set -euo pipefail

# Invoke the cleanup function after the script exists with a sucessful invocation
trap cleanup EXIT

# Some definition of ANSI colour codes for usage with the "echo" messages.
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NOCOLOR='\033[0m'

echo -e "${YELLOW}[INFO]${NOCOLOR} This script will download & setup Neovimulus for you now..."
echo -e "${YELLOW}[INFO]${NOCOLOR} Checking if certain prerequisite tools are available..."

# List of the prerequisite tools needed for proper functioninig of the framework
readonly programs=("git" "nvim" "gcc" "curl")

# Loop through the list of "programs" array to check if there are any missing prerequisite tools
for program in "${programs[@]}"; do
	if ! command -v "$program" &>/dev/null; then
		echo -e "${RED}[ERROR]${NOCOLOR}: \"${YELLOW}$program${NOCOLOR}\" is not installed or cannot be invoked!"
		echo -e "${YELLOW}[INFO]${NOCOLOR} Exiting....Refer to the usage guidelines to know what the prerequisite tools are."
		exit 1
	fi
done

echo -e "${GREEN}[SUCCESS]${NOCOLOR} All prerequisite tools are available...proceeding with setting up Neovimulus!"

echo -e "${YELLOW}[INFO]${NOCOLOR}: Downloading tarball from the remote GitHub repository..."

# Get the latest release tag name
LATEST_TAG=$(curl --fail --silent --show-error --location "https://api.github.com/repos/Jarmos-san/neovimulus/releases/latest" |
	grep --only-matching --perl-regexp '"tag_name": "\K(.*)(?=")')

# Construct the URL of the tarball
TARBALL_URL="https://github.com/Jarmos-san/neovimulus/archive/${LATEST_TAG}.tar.gz"

# Temporary location to store the tarball at (it'll be cleaned up later on)
TEMP_DIR=$(mktemp --directory)

# Name of the downloaded tarball
TARBALL="$TEMP_DIR/neovimulus.tar.gz"

# Download the tarball from the repository.
curl --fail --silent --show-error --location --output "$TARBALL" "$TARBALL_URL"

# Neovimulus configuration directory
NEOVIMULUS_CONFIG_DIR="$HOME/.config/neovimulus"

# Create the aforementioned config directory if it doesn't already exists.
if ! test -d "$NEOVIMULUS_CONFIG_DIR"; then
  mkdir --parents "$NEOVIMULUS_CONFIG_DIR"
fi

echo -e "${YELLOW}[INFO]${NOCOLOR} Download complete...extracting the configuration files to $NEOVIMULUS_CONFIG_DIR..."

# Extract the contents of the tarball to the Neovim configuration location
tar --extract --file="$TARBALL" --directory="$NEOVIMULUS_CONFIG_DIR" "init.lua" "ftplugin" "lua"

# Check if the ".bashrc" or ".bash_profile" files exists, if not then create either of them and append the "NVIM_APPNAME"
# environment variable which Neovim will natively use to switch to the Neovimulus configuration framework.
if ! test -f "$HOME/.bashrc" || "$HOME/.bash_profile"; then
  touch "$HOME/.bashrc" && echo "NVIM_APPNAME=$NEOVIMULUS_CONFIG_DIR" >> "$HOME/.bashrc"
fi

echo -e "${GREEN}[SUCCESS]${NOCOLOR} Neovimulus was successfully installed and setup!"
echo -e "${YELLOW}[INFO]{$NOCOLOR} You can now restart you terminal and invoke the \"nvim\" command to start using Neovimulus..."

# Remove all unnecessary artifacts created by the script upon successful execution
cleanup() {
	rm --recursive --force "$TEMP_DIR"
}
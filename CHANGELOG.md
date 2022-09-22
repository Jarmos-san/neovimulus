# Change Log

All notable changes to the project will be documented in this file.

The format is based on [Keep a Changelog][1] & the project adheres to
[Semantic Versioning][2].

## [Unreleased]

The following features & upgrade notes has been implemented in to the project
or has not made itself into the public release yet. If you want to track the
unreleased features, check out the `main` branch.

### Added

- Placeholder
- Placeholder
- Placeholder
- Placeholder

### Changed

- Placeholder
- Placeholder
- Placeholder
- Placeholder

### Fixed

- Placeholder
- Placeholder
- Placeholder
- Placeholder

## [1.0.0] - 2022-08-22

This is the public release of the project which has been long overdue! To be
able to finally release the first major version of the project is an experience
I can't clearly express.

But personal emotions aside, the v1 of the project is special. For more
context, this version of the project will **ALWAYS** ensure you have a bare
minimum Neovim configuration available to you. The bare minimum configurations
comes with a LSP & better autocompletion support which should be more than
enough to use the editor as a "daily drive".

As such, simply pull the Docker image from the GitHub Registry to your local
machine. And the container with the following command:

```console
# Pull the Docker image locally.
docker pull ghcr.io/jarmos-san/neovim-docker:v1.0.0

# Run the Docker container interactively.
docker run -it --rm \
    -v "$(pwd)/init.lua:/root/.config/nvim/init.lua" \
    -v "$(pwd)lua:/root/.config/nvim/lua" \
    ghcr.io/jarmos-san/neovim-docker:v1.0.0
```

Found some bug or broken features? Please file a report with proper details in
an [issue thread][3].

### Added

- Placeholder content

<!-- Reference Links -->

[1]: http://keepachangelog.com
[2]: http://semver.org
[3]: https://github.com/Jarmos-san/neovim-docker/issues/new/choose

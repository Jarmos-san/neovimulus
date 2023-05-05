# 🍱 A Minimal & Hackable Neovim Configuration Framework!

I have been using Neovim for years now and the custom Neovim environment I use
for writing code was developed over all the years I have been using the tool.
Some coworkers/friends noticed my work environment and would often ask me to
share my configurations for their usage as well. In that case, I would generally
share my [dotfiles][1] repository but unfortunately sharing my personal dotfiles
is not a stable solution here. The repository is ever-changing and is obviously
**VERY** personalised and my personal preferences might not suit someone else's
needs! Hence, I created a Neovim configuration framework taking only relevant
portions of my original configuration instead.

## ⁉️ Why to Use This Neovim Configuration?

As mentioned earlier, I created this project to share my Neovim configurations
with friends and coworkers. While I could guide them towards using other
existing more popular alternatives like [NvChad][2], [LazyVim][3],
[AstroNvim][4] & more, I felt those config frameworks beats the purpose of using
Neovim in the first place!

The developers of Neovim created the tool with hackability and customisation in
mind. And the out-of-the-box IDE-like experience the aforementioned alternatives
provides does not serve much justice. On the flip side, there is the
[kickstart.nvim][5] project which I found to be a "_bit too minimal_". Most of
my friends and others do not have the patience to spend a couple of weekends
tweaking their development environment to write code!

Neovimulus on the other hand, takes a middle ground, its neither "_too minimal_"
nor is it bloated with unnecessary which you as a user might never use. Like its
cousin projects, Neovimulus provides an automated installation process. In doing
so, the user is relieved of setting up some of the most stressful parts of
tweaking a Neovim IDE i.e getting LSP to _just work_. On top of it, the project
keeps enough room for further hacking if the user ever decides to go down that
path!

In fact, Neovimulus users are also **STRONGLY** recommended to take a look at
the source code of the project. The source code is heavily documented for this
exact reason. And trust me this practice should eventually make you more
comfortable to get started with your journey to customise your own [Personalised
Developement Environment (PDE)][6].

In other words, Neovimulus stays out of your way where it needs to but holds
your hand where it needs to.

## 🦮 How to Install Neovimulus

Using this project is rather quite straightforward, you only need to invoke
certain scripts and let those scripts do their thing. And for those you who are
absolutely new the world of Neovim, I welcome you wholeheartedly! But before you
proceed further refer to the ["resources"](#-resources-to-use-neovim) section if
you need some help to learn the basics of using Neovim in the first place.

**NOTE**: Its **RECOMMENDED** to take a look at the [scripts][7] and understand
what they do before you invoke them. Its bad practice to blindly invoke
arbitrary shell scripts you find on the Internet!

### 🏗️ Installing Neovimulus

Before you proceed ahead with the installation procedure, please ensure you have
the following set of prerequisite tools installed and running:

- [Git][8] for downloading/updating Neovim plugins.
- [Neovim][9] for obvious reasons.
- [cURL][10] for downloading various stuff like the LSP server binaries.
- [GCC][11] for compiling the Treesitter parsers which provides better syntax
  highlighting.

With the prerequisite tools installed and verified, run the following command:

```console
# NOTE: This command will fetch the contents of the installation script before
# invoking it automatically!
curl -fsSL https://tinyurl.com/install-neovimulus | bash
```

Once the script completes execution, run Neovim by invoking the `nvim` command
on the interactive shell environment and the plugins should be automatically
installed for you. Take note, the first time you invoke the `nvim` command it
might appear to have hanged, but do not worry about it, Neovim is attempting to
run a `git` command in the background to setup [lazy.nvim][12] (a plugin manager
for Neovim). You will face such an issue ever after the initial setup step is
complete.

Thereafter here are a couple of important commands which you should bear in mind
for keeping the environment up-to date:

- `:Lazy sync` to update the Neovim plugins and generate the `lazy-lock.json`
  file. For more information on the plugin manager, check out the documentations
  at `:h lazy`
- `:Mason` and `:MasonToolsUpdate` to keep a track of all the LSP servers and
  keeping them up-to date. For more information on the tool, check out the
  documentations at `:h mason` and `:h mason-tool-installer`.
- `:TSUpdate` to fetch the latest Treesitter updates and updating the parsers
  for better syntax highlighting & much more. For more documentations about
  Treesitter support, check out the documentations at `:h treesitter`.

### 📖 Brief Usage Guidelines

While this brief documentation is not a replacement to a more comprehensive
guide to learning Vim in general, this section will shed some brief insights to
get your feet wet at the very least! To learn to use Vim in more details, check
out some of the guides shared in the resources section towards the end of the
README.

That said, for the uninitiated here is what you should a little bit about Neovim
(or Vim) in general:

1. Neovim (which is a fork of Vim) is a terminal-based hackable Text Editor. It
   supports Lua as an embedded language for customising it and pretty much what
   you can make Neovim do is limited by the capabilities of Lua itself!
2. The Text Editor has a couple of modes which makes editing source code an
   absolute breeze. Learning to fully utilise the modes takes a while and
   practice (so be patient!). One such mode is the "_Command_" mode and you can
   active by pressing `:` once. You have come across a few such modes above in
   the previous section. So for practice's sake, try running this command
   `:h vim-modes` which should open up the inbuilt documentation of all the Vim
   modes available to you!
3. Thanks to how hackable the Text Editor is and the fact that Lua is a lovely
   language to write code with, we have a ton of plugins to use with Neovim.
   Each of these plugins perform certain tasks like installing and managing
   other plugins or enabling autocompletion like you would find on VSCode!
   Neovimulus use the `lazy.nvim` plugin to install and manage all the plugins
   for you. You are recommended to read more about the plugin in the
   documentations and take a look at the [list of plugins][13] Neovimulus
   installs for you.
4. In addition to the plugins, Neovimulus also configures the Neovim experience
   for you a bit by enabling certain options. Its recommended to check out the
   documentations (see `:h options`) before taking a look at what those
   [options][14] are.
5. Besides the options and plugins, Neovimulus also provides some "_default_"
   keybinds and "_autocommands_" (see `:h autocommands`) which are special code
   snippets invoked right after certain events happen when using Neovim. And you
   can take a look at [list of keybinds][15] as well as the [autocommands][16]
   or use the `which-key` plugin to refer to the keybinds interactively.

Suffice to say, explaining every little detail of using Neovim is a bit
out-of-scope of this README but I hope the Neovimulus project acts as a stepping
stone for you to learn more about the tool! So, if you ever need any help with
using the project or Neovim in general, do not hesitate to open a discussion
thread.

### ♻️ Uninstalling Neovimulus

Just as how easy it is to install Neovimulus, its equally easier to remove
Neovimulus. There's a automation script which will remove all data related to
Neovimulus from you local system.

That said, run the following command to get rid of Neovimulus:

```console
curl -fsSL https://tinyurl.com/uninstall-neovimulus | bash
```

Do note, the script performs certain destructive actions, so verify the contents
of the script before invoking it!

## 🫂 Contributing & Supporting the Project

The project would not have seen the light of the day had I not received the
motivation and the push from community members (as well as friends). Hence, it
would be an immense pleasure if you could lend be a hand or two to maintain and
develop this project further! So, the project piqued your interests, here is how
you can contribute to it.

### 🦮 How to Contribute to the Project

There are numerous ways to contribute to the project & here are a few ways I can
think of on the top of my head.

- Found bugs? Report it by opening an [issue thread][17].
- Have a better plugin or an enhancement suggestions? Let me know about it.
- Are you interested in writing Lua code or perhaps use this project as your
  own? Then feel free to share a PR or two.
- Found the project useful to get started with working on Neovim at your
  workplace? Then consider sponsoring the project.

For more information on contributing to the project, feel free to open a
[discussion thread][18] and/or read the ["Contribution Guidelines"][19].

## 📚 Resources to Use (Neo)Vim

Neovim (which is a fork of [Vim][20] btw) has a bit of learning curve but it
yields in dividends if you can invest the time and effort to learn to use the
tool! So here is a non-exhaustive list of resources to learn to use, manage
and/or customise your Neovim experience:

1. [Learn Vim the Smart Way][21] to learn to use the very basics of Vim.
2. [Guide to Use Lua in Nvim][22] to learn to code with Lua for customising
   Neovim (or even developing plugins).
3. The inbuilt "Vim Tutor" (see `:h vimtutor` for documentations) or refer to
   this online write-up - [Vimtutor by University College London][23].
4. [Vim Adventures][24] to learn Vim through an interative game on the browser!

Are you aware of more helpful resources and/or feel I missed out on something?
Then please feel free to open a PR.

## 📄 Usage Terms & Conditions

The project is licensed under the terms & conditions (T&Cs) for the MIT license.
So, you free to use, distribute, copy, modify & such with the contents of this
repository in whatever manner you want to. The caveat is, your usage should
adhere to the T&Cs of the MIT license.

For more information on the licensing T&Cs, feel free to refer to the
[LICENSE](./LICENSE) document.

<!-- Reference Links -->

[1]: https://github.com/Jarmos-san/dotfiles
[2]: https://nvchad.com
[3]: https://www.lazyvim.org
[4]: https://astronvim.com
[5]: https://github.com/nvim-lua/kickstart.nvim
[6]: https://youtu.be/QMVIJhC9Veg
[7]: https://github.com/Jarmos-san/neovim-docker/tree/main/scripts
[8]: https://git-scm.com
[9]: https://neovim.io
[10]: https://curl.se
[11]: https://gcc.gnu.org
[12]: https://github.com/folke/lazy.nvim
[13]:
  https://github.com/Jarmos-san/neovimulus/blob/main/neovimulus/lua/plugins.lua
[14]:
  https://github.com/Jarmos-san/neovimulus/blob/main/neovimulus/lua/options.lua
[15]:
  https://github.com/Jarmos-san/neovimulus/blob/main/neovimulus/lua/keybinds.lua
[16]:
  https://github.com/Jarmos-san/neovimulus/blob/main/neovimulus/lua/autocmds.lua
[17]: https://github.com/Jarmos-san/neovimulus/issue
[18]: https://github.com/Jarmos-san/neovimulus/discussion
[19]: ./.github/CONTRIBUTING.md
[20]: https://www.vim.org
[21]: https://learnvim.irian.to
[22]: https://neovim.io/doc/user/lua-guide.html
[23]: http://www2.geog.ucl.ac.uk/~plewis/teaching/unix/vimtutor
[24]: https://vim-adventures.com

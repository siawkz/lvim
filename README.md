# KZ LunarVim

## Install

### Prerequisites

- [Neovim](neovim-install) >= v0.8.0

```shell
  brew install neovim --nightly
```

- [Rust](https://www.rust-lang.org/tools/install)
  and telescope stuff:
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fd](https://github.com/sharkdp/fd)

```shell
curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh
cargo install ripgrep fd-find
```

- NodeJS >= v16.13.0 [nvm](https://github.com/nvm-sh/nvm)
  most language servers need this

```shell
# install LunarVim
mv ~/.config/lvim ~/.config/lvim_backup
git clone https://github.com/siawkz/lvim.git ~/.config/lvim
lvim +LvimUpdate +LvimCacheReset +q
lvim # run :Lazy sync
```

- [CodeGPT](https://github.com/dpayne/CodeGPT.nvim)
```shell
# set enviroment variable in /etc/environment
OPENAI_API_KEY="your openapi api key"
```

### Recommended Fonts

JetBrainsMono Nerd Font

## Custom Key-mappings

Note that,

- **Leader** key set as <kbd>Space</kbd>

Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command

### UI

| Key                                                           | Mode | Action              | Plugin or Mapping                             |
| ------------------------------------------------------------- | :--: | ------------------- | --------------------------------------------- |
| <kbd>Space</kbd>+<kbd>e</kbd>                                 |  𝐍   | Open file tree      | <small>NvimTree</small>                       |
| <kbd>Space</kbd>+<kbd>o</kbd>                                 |  𝐍   | Open symbols        | <small>Symbols-outline</small>                |
| <kbd>Space</kbd>+<kbd>f</kbd>                                 |  𝐍   | Open file finder    | <small>Telescope</small>                      |
| <kbd>Space</kbd>+<kbd>h</kbd>                                 |  𝐍   | Remove highlight    | <small>`nohlsearch`</small>                   |
| <kbd>Space</kbd>+<kbd>/</kbd>                                 |  𝐍   | Toggle comment      | <small>Comment.nvim</small>                   |
| <kbd>Space</kbd>+<kbd>?</kbd>                                 |  𝐍   | Open cheats         | <small>cheat.sh</small>                       |
| <kbd>Space</kbd>+<kbd>'</kbd>                                 |  𝐍   | Open marks          | <small>which-key marks</small>                |
| <kbd>Space</kbd>+<kbd>P</kbd>                                 |  𝐍   | Projects            | <small>project.nvim</small>                   |
| <kbd>Ctrl</kbd>+<kbd>\</kbd>                                  | 𝐈 𝐍  | Open terminal       | <small>toggleterm.nvim</small>                |
| <kbd>Alt</kbd>+<kbd>0</kbd>                                   | 𝐈 𝐍  | Vertical terminal   | <small>toggleterm.nvim</small>                |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>                                  |  𝐈   | Show signature help | <small>`vim.lsp.buf.signature_help()`</small> |
| <kbd>Alt</kbd>+<kbd>s</kbd>                                   |  𝐈   | Snippet selection   | <small>Telescope luasnip extension</small>    |
| <kbd>Space</kbd>+<kbd>C</kbd> or <kbd>Ctrl</kbd>+<kbd>P</kbd> |  𝐍   | Command Palette     | <small>legendary.nvim</small>                 |

### Motion

| Key                         | Mode | Action                  | Plugin or Mapping                    |
| --------------------------- | :--: | ----------------------- | ------------------------------------ |
| <kbd>f</kbd>                |  𝐍   | find next character     | <small>HopChar1CurrentLineAC</small> |
| <kbd>F</kbd>                |  𝐍   | find previous character | <small>HopChar1CurrentLineBC</small> |
| <kbd>s</kbd>                |  𝐍   | find character          | <small>HopChar2MW</small>            |
| <kbd>S</kbd>                |  𝐍   | find word               | <small>HopWordMW</small>             |
| <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐈   | select all              | <small>ggVG</small>                  |
| <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐍   | increment number        | <small>C-A</small>                   |
| <kbd>Alt</kbd>+<kbd>x</kbd> |  𝐍   | decrement number        | <small>C-X</small>                   |

### LSP

| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    |  𝐈   | Navigate completion-menu            |
| <kbd>Enter</kbd>                                                                         |  𝐈   | Select completion or expand snippet |
| <kbd>Up</kbd>or <kbd>Down</kbd>                                                          |  𝐈   | Movement in completion pop-up       |
| <kbd>]</kbd>+<kbd>d</kbd>                                                                |  𝐍   | Next diagnostic                     |
| <kbd>[</kbd>+<kbd>d</kbd>                                                                |  𝐍   | Previous diagnostic                 |
| <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>j</kbd> or <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>k</kbd> |  𝐍   | Next/previous LSP diagnostic        |
| <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>r</kbd>                                               |  𝐍   | replace current word in project     |
| <kbd>Ctrl</kbd>+<kbd>e</kbd>                                                             |  𝐈   | Close pop-up                        |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    | 𝐈 𝐒  | Navigate snippet placeholders       |
| <kbd>Space</kbd>+<kbd>l</kbd>                                                            |  𝐍   | keybindings for lsp                 |
| <kbd>g</kbd>+<kbd>a</kbd>                                                                |  𝐍   | code actions                        |
| <kbd>g</kbd>+<kbd>A</kbd>                                                                |  𝐍   | codelens actions                    |
| <kbd>g</kbd>+<kbd>d</kbd>                                                                |  𝐍   | goto definition                     |
| <kbd>g</kbd>+<kbd>t</kbd>                                                                |  𝐍   | goto type definition                |
| <kbd>g</kbd>+<kbd>D</kbd>                                                                |  𝐍   | goto declaration                    |
| <kbd>g</kbd>+<kbd>I</kbd>                                                                |  𝐍   | goto implementation                 |
| <kbd>g</kbd>+<kbd>p</kbd>                                                                |  𝐍   | peek implementation                 |
| <kbd>g</kbd>+<kbd>r</kbd>                                                                |  𝐍   | goto references                     |
| <kbd>g</kbd>+<kbd>s</kbd>                                                                |  𝐍   | show signature help                 |

### Plugin: LazyGit

| Key                                        | Mode | Action           |
| ------------------------------------------ | :--: | ---------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>g</kbd> |  𝐍   | Open lazy git UI |

### Plugin: Persistence

| Key                                        | Mode | Action                                |
| ------------------------------------------ | :--: | ------------------------------------- |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>d</kbd> |  𝐍   | Quit without saving session           |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>l</kbd> |  𝐍   | Restore last session                  |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>s</kbd> |  𝐍   | Restore last session from current dir |

### Plugin: Bufferline

| Key                                        | Mode | Action               |
| ------------------------------------------ | :--: | -------------------- |
| <kbd>Shift</kbd>+<kbd>x</kbd>              |  𝐍   | Close buffer         |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>f</kbd> |  𝐍   | Find buffer          |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>b</kbd> |  𝐍   | Toggle buffer groups |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>p</kbd> |  𝐍   | Toggle pin           |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>s</kbd> |  𝐍   | Pick buffer          |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>1</kbd> |  𝐍   | Goto buffer 1        |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>h</kbd> |  𝐍   | Close all to left    |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>l</kbd> |  𝐍   | Close all to right   |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>D</kbd> |  𝐍   | Sort by directory    |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>L</kbd> |  𝐍   | Sort by language     |

### Plugin: nvim-window-picker

| Key                           | Mode | Action      |
| ----------------------------- | :--: | ----------- |
| <kbd>Space</kbd>+<kbd>w</kbd> |  𝐍   | Pick Window |
| <kbd>Space</kbd>+<kbd>W</kbd> |  𝐍   | Swap Window |

### Plugin: hlslens

| Key            | Mode | Action                             |
| -------------- | :--: | ---------------------------------- |
| <kbd>\*</kbd>  |  𝐍   | Search & go to next selected word  |
| <kbd>#</kbd>   |  𝐍   | Search & go to prev selected word  |
| <kbd>g\*</kbd> |  𝐍   | Search & go to first selected word |
| <kbd>g#</kbd>  |  𝐍   | Search & go to last selected word  |

### Plugin: Trouble

| Key                                        | Mode | Action                |
| ------------------------------------------ | :--: | --------------------- |
| <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>d</kbd> |  𝐍   | Diagnostics           |
| <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>f</kbd> |  𝐍   | Definitions           |
| <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>r</kbd> |  𝐍   | References            |
| <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>t</kbd> |  𝐍   | Todo                  |
| <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>w</kbd> |  𝐍   | Workspace diagnostics |

### Plugin: Neotest

| Key                                        | Mode | Action                       |
| ------------------------------------------ | :--: | ---------------------------- |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>a</kbd> |  𝐍   | Run all tests                |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>f</kbd> |  𝐍   | Run tests in a file          |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>r</kbd> |  𝐍   | Only run nearest test        |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>s</kbd> |  𝐍   | Open test summary            |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>o</kbd> |  𝐍   | Open test output             |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>w</kbd> |  𝐍   | Watch test                   |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>x</kbd> |  𝐍   | Stop test                    |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>n</kbd> |  𝐍   | Jump to next failed test     |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>p</kbd> |  𝐍   | Jump to previous failed test |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>c</kbd> |  𝐍   | Cancel test                  |

### Plugin: Spectre

| Key                                        | Mode | Action                         |
| ------------------------------------------ | :--: | ------------------------------ |
| <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>p</kbd> |  𝐍   | Replace word in project        |
| <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>w</kbd> |  𝐍   | Replace visually selected word |
| <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>f</kbd> |  𝐍   | Replace word in current buffer |

### Plugin: SSR

| Key                                        | Mode | Action                                          |
| ------------------------------------------ | :--: | ----------------------------------------------- |
| <kbd>Space</kbd>+<kbd>r</kbd>              |  𝐕   | Structural replace confirm using `<leader><cr>` |
| <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>s</kbd> |  𝐍   | Structural replace confirm using `<leader><cr>` |

### Plugin: Copilot

| Key                                        | Mode | Action                |
| ------------------------------------------ | :--: | --------------------- |
| <kbd>Space</kbd>+<kbd>c</kbd>+<kbd>f</kbd> |  𝐍   | Force Enable Copilot  |
| <kbd>Space</kbd>+<kbd>c</kbd>+<kbd>d</kbd> |  𝐍   | Force Disable Copilot |
| <kbd>Space</kbd>+<kbd>c</kbd>+<kbd>t</kbd> |  𝐍   | Toggle Suggestion     |
| <kbd>Alt</kbd>+<kbd>p</kbd>                |  𝐈   | Accept                |
| <kbd>Alt</kbd>+<kbd>w</kbd>                |  𝐈   | Accept Word           |
| <kbd>Alt</kbd>+<kbd>l</kbd>                |  𝐈   | Accept Line           |
| <kbd>Alt</kbd>+<kbd>]</kbd>                |  𝐈   | Next                  |
| <kbd>Alt</kbd>+<kbd>[</kbd>                |  𝐈   | Previous              |
| <kbd>Ctrl</kbd>+<kbd>]</kbd>               |  𝐈   | Dismiss               |

### Plugin: Lsp_Lines

| Key                           | Mode | Action                   |
| ----------------------------- | :--: | ------------------------ |
| <kbd>Space</kbd>+<kbd>v</kbd> |  𝐍   | Toggle showing lsp_lines |

### Plugin: NeoTree

| Key                           | Mode | Action                           |
| ----------------------------- | :--: | -------------------------------- |
| <kbd>Space</kbd>+<kbd>e</kbd> |  𝐍   | Toggle tree                      |
| <kbd>></kbd> and <kbd><</kbd> |  𝐍   | Next and prev source inside tree |
| <kbd><cr></kbd>               |  𝐍   | Open                             |
| <kbd>s</kbd>                  |  𝐍   | Open in vertical split           |
| <kbd>S</kbd>                  |  𝐍   | Open in horizontal spit          |
| <kbd>H</kbd>                  |  𝐍   | Toggle hidden files              |
| <kbd>a</kbd>                  |  𝐍   | Add files/dirs                   |
| <kbd>A</kbd>                  |  𝐍   | Add new dir                      |
| <kbd>r</kbd>                  |  𝐍   | Rename                           |
| <kbd>h</kbd>                  |  𝐍   | Go Updir                         |
| <kbd>l</kbd>                  |  𝐍   | Open                             |
| <kbd>P</kbd>                  |  𝐍   | Toggle preview                   |
| <kbd>/</kbd>                  |  𝐍   | Fuzzy finder                     |

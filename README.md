# A neovim config

Not mine, not @dotangad's, not @PseudoCodeNerd's setup. This is *a* neovim
config.

@PseudoCodeNerd originally wrote:
> Well this is my personal setup and i wouldn't really recommend using it (it
> has some weird keybindings)
> `init.vim` has comments to tell you what everything does. Most of the comment
> s are by my friend [soumitradev](https://github/com/soumitradev) (please
> pardon his attempt to be humorous, he is not...) and i've added some as well.
>
> In the end, this config still remains inspired by dotangad's and me and soumi
> both thank him for giving us this starter to configure our own setups.

---

## Steps

*taken from dotangad's repo*

1. Clone this repo

```sh
mv $HOME/.config/nvim $HOME/.config/nvim.bak >> /dev/null
git clone https://github.com/pseudocodenerd/dotvim $HOME/.config/nvim
```

1. Install `vim-plug`

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

---

> p.s: soumi still is a vscode fanboy and has ported vsc keybindings to his vim
> config smh

The above statement is true.

### The long story (if you're interested)

@dotangad makes a nvim config repo -> @PseudoCodeNerd forks it, customises it ->
I end up switching to nvim from vscode, use his config as a starter, and
customise it -> @PseudoCodeNerd's nvim config dies, uses mine as a starter ->
Uploads it to a repo -> Repo ownership gets transferred to me

Now I own this repo I guess. This is *close* to my setup, but not exactly.
This is also *close* to @PseudoCodeNerd's config, but not exactly.


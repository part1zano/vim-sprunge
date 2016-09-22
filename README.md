[Sprunge.vim](https://github.com/chilicuil/vim-sprunge) is a global plugin to post to [Paste at bein.link](http://paste.bein.link/)

Preview
-------

<p align="center">
  <img src="http://javier.io/assets/img/vim-sprunge.gif"/><br>
</p>

Requirements
------------

* Vim 7.0+
* curl 7.0+

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your $HOME/.vimrc file:

        Bundle 'part1zano/vim-sprunge'

    And run inside of vim:

        :BundleInstall

- [NeoBundle](https://github.com/Shougo/neobundle.vim) way:

        NeoBundle 'part1zano/vim-sprunge'

    And run inside of vim:

        :NeoBundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/part1zano/vim-sprunge.git ~/.vim/bundle/vim-sprunge

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv vim-sprunge*.zip $HOME/.vim
        cd $HOME/.vim && unzip vim-sprunge*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

<kbd>:Sprunge</kbd> to sprunge code to paste.bein.link, you may use it in visual mode to
sprunge only the selection.

You can also use the provided mapping of <kbd>\<Leader\>s</kbd> in both normal
mode (sprunge entire buffer) or visual mode (sprunge only the selection)

License
-------

© 2014 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/

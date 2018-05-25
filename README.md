# *vim-highlights* - VIM Syntax Highlighters for My Custom Filetype
My own syntax highlighters for VIM (Vi IMproved). Tested for VIM 7.4 and supported for bash 4.3.  
Filetype supported: *xyz*, *txyz*, *mfpx*, *fpar*.

## Rationale
Feeding programs with input files is often a frustrating experience. Lines of the input file which are not properly formatted can be weirdly interpreted by the program, either raising an (often unclear) error or (worse) running very far from intended. The opposite holds too: the user reads inputs and badly interprets them. These inputs can be very troublesome, with a lot of mandatory/optional columns, long comments, *vel similia*.  
As a matter of taste, I extensively use VIM (*Vi IMproved*) editor, and enjoy colours which highlight syntactic elements. VIM syntax highlighting helps me to prevent syntax errors and to focus on the crunch instead of syntax fluff.  
The default VIM package ships highlighting for more than 500 filetypes, arguably the most diffuse file formats used by developers. The list cannot be exhaustive since anyone can define their own filetype and, thus, syntax. Luckily, VIM lets user to customize syntax highlightings, as I did with my routinary filetypes.  
I share a few of these syntax highlightings with the goal to improve their definition for our ([@MOFplus](https://github.com/MOFplus) - CMC-RUB) users.

## Content
Two files take care of the syntax highlighting definition for each filetype. This is consistent with VIM default definition.  
The first file is the format detection and goes into the *ftdetect* directory. It is meant to set the filetype according to some condition. In the cases I introduce here, it is just one line that detects the file extension and assigns the filetype accordingly.  
Based on the filetype, a second file defines the syntax highlighting into the *syntax* directory. Here, the rules to detect the syntax elements and their highlights are defined. To customize yours, you needs to be fluent in regular expressions and it is *not* a one-liner.

## Installation
```
DIR=$HOME/.vim #target directory
git clone https://github.com/ramabile/vim-highlights
mkdir $DIR 2>/dev/null #if does not exist
cp -rn vim-highlights/{ftdetect,syntax}/ $DIR/ #do not overwrite existing files
```
If you do not like *$HOME/.vim* you can use VIM default directory (not recommented).  
Its path is the following: `vim --cmd ':silent !echo $VIMRUNTIME' --cmd 'quit'`. You can use `DIR=$(vim --cmd ':silent !echo $VIMRUNTIME' --cmd 'quit' 2>/dev/null)` to store the path in a variable.

To get the location of VIM runcommands, if need be:  
`vim --cmd ':version' --cmd 'quit' 2>&1 | grep vimrc | awk '{print $NF}' | tr -d '\"'`  
where `$VIM` is `vim --cmd ':silent !echo $VIM' --cmd 'quit'`, and `$HOME` your home directory.

## Remarks

### Author
* **Roberto Amabile** \[[ramabile](https://github.com/ramabile/)\]

### Licensing
This work is licensed under [WTFNMFPL-1.0](http://www.adversary.org/wp/2013/10/14/do-what-the-fuck-you-want-but-its-not-my-fault/). Full text of the licence can be found also [here](https://github.com/ramabile/vim-highlights/blob/master/LICENSE.txt). A summary with colorful symbols is [here](https://tldrlegal.com/license/do-what-the-fuck-you-want-to-but-it%27s-not-my-fault-public-license-v1-(wtfnmfpl-1.0)).

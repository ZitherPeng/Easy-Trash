# Easy-Trash
:see_no_evil:A simple shell script is used instead of the command "rm" on Linux/Unix.

If you have been dominated by the fear of "rm -rf /", then re-modifying your "rm" is a good choice.

## Getting Started 

**On the Linux:**

Copy the following code append to the file `/etc/profile` (all user effective) or `~/.bashrc` (only the current effective).

```bash
# add trash function
mkdir -p ~/.trash
alias rm=trash
alias trash-list='ls -la ~/.trash'
alias trash-restore=undelfile
alias trash-empty=cleartrash

undelfile()
{
  mv -i ~/.trash/$@ ./
}
trash()
{
  mv $@ ~/.trash/
}

cleartrash()
{
    read -p "clear sure?[n]" confirm
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*  && find ~/.trash/ -mindepth 1 -name '.*' | xargs rm -rf
}
```  

**On the MacOS**

Copy the following code append to the file `/etc/profile` (all user effective **but not recommend**) or `~/.bash_profile` (only the current effective).

```bash
# add trash function using graphical interface .Trash
alias rm=trash
alias trash-list='ls -la ~/.Trash'
alias trash-restore=undelfile
alias trash-empty=cleartrash

undelfile()
{
  mv -i ~/.Trash/$@ ./
}
trash()
{
  mv $@ ~/.Trash/
}

cleartrash()
{
    read -p "clear sure?[n]" confirm
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.Trash/*  && find ~/.Trash/ -mindepth 1 -name '.*' | xargs rm -rf
}
```

## Usage

```bash
trash [file ...]              # Move to trash can
trash-restore [file ...]      # Restore files from the trash can
trash-list                    # Display all contents of trash can
trash-empty                   # empty the trash can
```

## License

MIT License

Copyright (c) 2019 zither
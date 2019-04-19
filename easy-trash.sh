##########################################################################
# File Name: easy-trash.sh
# Author: zither
# mail: zitherdzdwr@gmail.com
#########################################################################
#!/bin/bash

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
    read -p "clear sure?[y/n]" confirm
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*  && find ~/.trash/ -mindepth 1 -name '.*' | xargs rm -rf
}

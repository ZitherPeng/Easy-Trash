# add trash function
mkdir -p ~/.trash
alias rm='echo "This is not the command you are looking for, Please Use "trash"!!!"; false'
alias trash-list='ls -la ~/.trash'
alias trash-restore=undelfile
alias trash-empty=cleartrash

trash(){
  for filename in $@
  do
    if [ -n "`find ~/.trash -maxdepth 1 -name ${filename}`" ]
    then
    mv ${filename} ~/.trash/${filename}_`date +%Y%m%d-%H%M%S-%2N`
    else
    mv ${filename} ~/.trash/
    fi
  done
}

cleartrash(){
  read -p "clear sure?[y/n]" confirm
  [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*  && find ~/.trash/ -mindepth 1 -name '.*' | xargs /bin/rm -rf
}

undelfile(){
  mv -i ~/.trash/$@ ./
}

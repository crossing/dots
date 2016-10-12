for i in $HOME/.profile.d/*.sh ; do
  . "$i"
done

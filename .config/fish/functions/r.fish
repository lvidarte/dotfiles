function r
  set LASTDIR (mktemp)
  ranger --choosedir=$LASTDIR; and cd (cat $LASTDIR)
  rm $LASTDIR
end

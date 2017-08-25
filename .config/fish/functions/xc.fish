function xc
    set FILE (mktemp)
    xclip -o > $FILE;
      and vim $FILE;
      and cat $FILE | xclip -selection clipboard;
      and rm -f FILE
end

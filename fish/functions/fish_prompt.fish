
function fish_prompt
  set_color white
  echo -n "["

  if test $USER = "root"
    set_color red
  else
    set_color blue
  end
  echo -n "$USER"

  set_color white
  echo -n "@"

  set_color yellow
  echo -n (hostname)

  set_color white
  echo -n ":"

  set_color blue
  echo -n (pwd)

  set_color white
  echo -n "]"

  set_color yellow
  echo "\$ "
end


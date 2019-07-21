
function posix-source
  for line in (cat $argv | grep --invert-match --line-regexp --perl-regexp --regexp="[ \t]*(#.+)?")
    set varValues (echo $line |tr = \n)
    set  --global --export $varValues[1] (echo $varValues[2] | sed -e 's/^"//' | sed -e 's/"$//')
    set --show $varValues[1]
  end
end



function posix-source
  for line in (cat $argv | grep --invert-match --line-regexp --perl-regexp --regexp="[ \t]*(#.+)?")
    set varValues (echo $line |tr = \n)
    set  --global --export $varValues[1] $varValues[2]
    set --show $varValues[1]
  end
end


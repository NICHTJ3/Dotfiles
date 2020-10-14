#! /bin/bash
dwm_clock (){
  dte="$(date +"%l:%M%p | %B %d"| sed -e 's/^[ \t]*//')"
  printf "%s" "$SEP1"
  printf "%s" "$dte"
  printf "%s" "$SEP2"
}
dwm_clock

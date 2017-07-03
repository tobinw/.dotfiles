alias scorec="ssh -X jumpgate.scorec.rpi.edu"
alias emacs="emacs -nw"
amos() {
  ssh -X ${1}@lp03.ccni.rpi.edu
}
export -f amos

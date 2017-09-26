if [[ ! -o interactive ]]; then
    return
fi

compctl -K _1p 1p

_1p() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(1p commands)"
  else
    completions="$(1p completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

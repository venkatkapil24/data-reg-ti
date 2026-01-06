lsfile="ls.data"
template_xml="input.xml"
template_lmp="in.lmp"

while read lam; do
  # skip empty or commented lines
  [[ -z "$lam" || "$lam" =~ ^# ]] && continue

  # make directory
  mkdir -p "$lam"

  # compute λ² and (1-λ)² with good precision
  lam1=$(awk -v l="$lam" 'BEGIN{printf("%.8f", l^6)}')
  lam2=$(awk -v l="$lam" 'BEGIN{printf("%.8f", (1.0-l)^6)}')

  # substitute in input.xml (all occurrences)
  sed -e "s/l1/${lam1}/g" \
      -e "s/l2/${lam2}/g" \
      "$template_xml" > "${lam}/input.xml"

  # substitute in in.lmp (all occurrences of l1 -> λ²)
  sed -e "s/l1/${lam1}/g" \
      "$template_lmp" > "${lam}/in.lmp"

done < "$lsfile"

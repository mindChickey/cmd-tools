
function compare-dir() {
  diff -rq "$1" "$2" | grep "differ$" | while read -r line; do
    file1=$(echo "$line" | awk '{print $3}')
    file2=$(echo "$line" | awk '{print $5}')
    code -d "$file1" "$2/${file1#$1/}"
  done
}

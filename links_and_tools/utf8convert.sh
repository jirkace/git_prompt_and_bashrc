mv "$1" "$1".bak
iconv -f WINDOWS-1250 -t UTF-8 "$1".bak > "$1"
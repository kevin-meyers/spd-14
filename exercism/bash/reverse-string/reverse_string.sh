reverse() {
	s=$1
	for ((i=0; i<${#s}; i++))
		do
		r="${s:$i:1}$r"; done
			echo $r
}

reverse "$@"

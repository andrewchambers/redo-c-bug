set -eux

case "$1" in
	nest/bar)
		redo-ifchange baz ../foo/foo
		touch "$3"
	;;

	baz)
		date > "$3"
	;;
esac
set -eux
case "$1" in
	foo)
		touch "$3"
	;;
esac
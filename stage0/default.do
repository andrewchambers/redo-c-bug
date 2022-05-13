set -eux
exec >&2

case "$1" in
	all)
		redo-ifchange all.done
	;;

	all.done)
		redo-ifchange ./some-file.txt
		date > "$3"
	;;

	*)
		echo "don't know how to build $1"
		exit 1
	;;
esac

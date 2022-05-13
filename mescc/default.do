set -eux
exec >&2

case "$1" in

	mes-sources.list)
		date > "$3"
	;;

	nyacc-sources.list)
		date > "$3"
	;;

	bin/mescc)
		redo-ifchange mes-sources.list nyacc-sources.list  ../stage0/all.done
		date > "$3"
	;;

	*)
		echo "don't know how to build $1"
		exit 1
	;;

esac

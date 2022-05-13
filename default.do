set -eux
exec >&2

case "$1" in
	all)
		redo-ifchange all.done
	;;

	all.done)
		redo-ifchange ./bin/mescc
		sha256sum $files > "$3"
	;;
	
	mes-sources.list)
		date > "$3"
	;;

	nyacc-sources.list)
		date > "$3"
	;;

	bin/mes)
		redo-ifchange ./mes-sources.list ./nyacc-sources.list ../stage0/all.done
		date > "$3"
	;;

	*)
		echo "don't know how to build $1"
		exit 1
	;;
esac

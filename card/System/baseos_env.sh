baseos_target_from_release() {
	release="$1"
	[ -r "$release" ] || return 0

	while IFS= read -r line; do
		case "$line" in
			BASEOS_TARGET=*)
				printf '%s\n' "${line#BASEOS_TARGET=}"
				return 0
				;;
		esac
	done < "$release"
}

export_baseos_target() {
	target="$(baseos_target_from_release "$1")"
	if [ -n "$target" ]; then
		export BASEOS_TARGET="$target"
	fi
}

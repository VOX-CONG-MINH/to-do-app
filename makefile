update_pos_icon:
	cd pos && dart run flutter_launcher_icons:main
update_pos_splash:
	cd pos && dart run flutter_native_splash:create
remove_pos_splash:
	cd pos && dart run flutter_native_splash:remove

build_all:
	@melos run build_all
build_pos:
	@melos run build_pos
build_domain:
	@melos run build_domain
build_data:
	@melos run build_data
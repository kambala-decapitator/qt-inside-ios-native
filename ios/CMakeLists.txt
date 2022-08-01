if(EMBEDDED_QT_APP)
	set(APP_TARGET ios-app)
	add_executable(${APP_TARGET}
		main.m
		ViewController.h
		ViewController.mm
	)
	target_link_libraries(${APP_TARGET} PRIVATE
		QtApp
		"-framework UIKit"
	)
else()
	set(APP_TARGET QtApp)
endif()

set_target_properties(${APP_TARGET} PROPERTIES
	MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist"
	MACOSX_BUNDLE TRUE
)

target_sources(${APP_TARGET} PRIVATE LaunchScreen.storyboard)
set_source_files_properties(LaunchScreen.storyboard PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

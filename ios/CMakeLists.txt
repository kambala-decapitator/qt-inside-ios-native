add_executable(ios-app
	main.m
	ViewController.h
	ViewController.m
)
target_link_libraries(ios-app PRIVATE
	"-framework UIKit"
)
set_target_properties(ios-app PROPERTIES
	MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist"
	MACOSX_BUNDLE TRUE
)

target_sources(ios-app PRIVATE LaunchScreen.storyboard)
set_source_files_properties(LaunchScreen.storyboard PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

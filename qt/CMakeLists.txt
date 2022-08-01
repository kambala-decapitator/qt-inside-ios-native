set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

set(PROJECT_SOURCES
	main.cpp
	main.h
	widget.cpp
	widget.h
)

if(EMBEDDED_QT_APP)
	list(APPEND PROJECT_SOURCES main.mm)
	if(QT_VERSION_MAJOR GREATER_EQUAL 6)
		qt_add_library(QtApp STATIC
			${PROJECT_SOURCES}
		)
	else()
		add_library(QtApp STATIC
			${PROJECT_SOURCES}
		)
	endif()
	target_include_directories(QtApp PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
	target_compile_definitions(QtApp PUBLIC EMBEDDED_QT_APP)
else()
	if(QT_VERSION_MAJOR GREATER_EQUAL 6)
		qt_add_executable(QtApp
			${PROJECT_SOURCES}
		)
	else()
		add_executable(QtApp
			${PROJECT_SOURCES}
		)
	endif()

	if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
		if(QT_VERSION_MAJOR EQUAL 5)
			set(CMAKE_EXE_LINKER_FLAGS "-Wl,-e,_qt_main_wrapper")
		endif()
	else()
		set_target_properties(QtApp PROPERTIES
			MACOSX_BUNDLE_GUI_IDENTIFIER com.kambala.QtApp
			MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
			MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
			MACOSX_BUNDLE TRUE
			WIN32_EXECUTABLE TRUE
		)
	endif()
endif()

target_link_libraries(QtApp PUBLIC Qt${QT_VERSION_MAJOR}::Widgets)

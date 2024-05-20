# qt-inside-ios-native

Demonstration of embedding Qt GUI (widgets in this example) app inside native iOS app.

## Main caveat

Embedding Qt app is pretty straightforward: simply call the Qt's "`main`" function that is a default entrypoint for standard Qt apps.

But there's one issue: nothing new appears on the screen. The trick depends on Qt version:
- 6.5 and above: find the created Qt window, obtain native `UIView` handle and add it to the main app window (the key window). See https://github.com/kambala-decapitator/qt-inside-ios-native/commit/3990100ec384368be5c1f0cb43d1f43ada819454.
- earlier versions: find the created Qt window, obtain native `UIView` handle, add it to the native `UIWindow` created by Qt and make the native window "key and visible". See https://github.com/kambala-decapitator/qt-inside-ios-native/commit/acc313184fbd0641e31b6b6cb310ce691c200714. (probably you can also add the native view directly to your own window)

To "kill" Qt app, call `qApp->quit()`.

### Running Qt app on launch from custom AppDelegate

If you simply need custom app delegate without any native UI, you still have to create `UIWindow` and then run Qt's "`main`" function as soon as app becomes active, for example:

```objc
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	self.window.rootViewController = [UIViewController new];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		auto executablePath = NSBundle.mainBundle.executablePath;
		char* argv[] = {const_cast<char*>(executablePath.fileSystemRepresentation)};
		qt_app_main(1, argv);
	});
}

@end
```

## Configure options

iOS has `EMBEDDED_QT_APP` boolean option (on by default) which controls if Qt app is embedded inside the native app or Qt app is launched directly.

## Building

CMake configuration examples for iOS, codesigning parameters are omitted. Building and launching on device (or simulator) is done from Xcode.

You can also build directly from Qt Creator for desktop platforms.

### Qt 5

```bash
# set the variable to your Qt 5 installation
QTDIR=~/dev/Qt-libs/5.15.5/ios10-widgets

mkdir build
cd build

cmake .. -G Xcode \
  -DCMAKE_PREFIX_PATH="$QTDIR" \
  --toolchain ../ios/ios-cmake/ios.toolchain.cmake \
  -DPLATFORM=OS64
open qt-inside-ios-native.xcodeproj
```

### Qt 6

```bash
# set the variable to your Qt 6 installation
QTDIR=~/dev/Qt-libs/6.3.1/ios12-widgets

mkdir build
cd build

"$QTDIR/bin/qt-cmake" ..
open qt-inside-ios-native.xcodeproj
```

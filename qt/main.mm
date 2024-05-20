#import <UIKit/UIKit.h>

#include <QGuiApplication>
#include <QWindow>

namespace
{
UIView* addQtWindowNativeViewToNativeWindow(UIWindow* window)
{
	auto qtWindow = qApp->topLevelWindows()[0];
	auto qtWindowNativeView = (__bridge UIView*)reinterpret_cast<void*>(qtWindow->winId());
	[window.rootViewController.view addSubview:qtWindowNativeView];
	return qtWindowNativeView;
}
}

void showQtWindow()
{
	auto app = UIApplication.sharedApplication;

	// TODO: checked if needed in 6.4
#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
	auto nativeView = addQtWindowNativeViewToNativeWindow(app.keyWindow);
	nativeView.frame = nativeView.superview.bounds;
#else
	auto qtNativeWindowIndex = [app.windows indexOfObjectPassingTest:^BOOL(__kindof UIWindow * _Nonnull window, NSUInteger idx, BOOL * _Nonnull stop) {
		return [NSStringFromClass([window class]) isEqualToString:@"QUIWindow"];
	}];
	Q_ASSERT(qtNativeWindowIndex != NSNotFound);

	auto qtNativeWindow = app.windows[qtNativeWindowIndex];
	addQtWindowNativeViewToNativeWindow(qtNativeWindow);
	[qtNativeWindow makeKeyAndVisible];
#endif
}

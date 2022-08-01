#import <UIKit/UIKit.h>

#include <QGuiApplication>
#include <QWindow>

void showQtWindow()
{
	auto app = UIApplication.sharedApplication;
	auto qtNativeWindowIndex = [app.windows indexOfObjectPassingTest:^BOOL(__kindof UIWindow * _Nonnull window, NSUInteger idx, BOOL * _Nonnull stop) {
		return [NSStringFromClass([window class]) isEqualToString:@"QUIWindow"];
	}];
	Q_ASSERT(qtNativeWindowIndex != NSNotFound);

	auto qtWindow = qApp->topLevelWindows()[0];
	auto qtWindowNativeView = (__bridge UIView*)reinterpret_cast<void*>(qtWindow->winId());

	auto qtNativeWindow = app.windows[qtNativeWindowIndex];
	[qtNativeWindow.rootViewController.view addSubview:qtWindowNativeView];
	[qtNativeWindow makeKeyAndVisible];
}

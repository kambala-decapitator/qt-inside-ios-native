#import "ViewController.h"

#include "main.h"

@implementation ViewController

- (void)loadView {
	self.view = [UIView new];
	self.view.backgroundColor = UIColor.whiteColor;

	__auto_type button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.translatesAutoresizingMaskIntoConstraints = NO;
	[button setTitle:@"Show Qt app" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(showQtApp) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];

	[NSLayoutConstraint activateConstraints:@[
		[button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
		[button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
	]];
}

- (void)showQtApp {
	auto executablePath = NSBundle.mainBundle.executablePath;
	char* argv[] = {const_cast<char*>(executablePath.fileSystemRepresentation)};
	qt_app_main(1, argv);
}

@end

#import "ViewController.h"

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
}

@end

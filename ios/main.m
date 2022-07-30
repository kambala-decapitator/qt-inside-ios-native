#import "ViewController.h"

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow* window;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	self.window.rootViewController = [ViewController new];
	[self.window makeKeyAndVisible];
	return YES;
}

@end


int main(int argc, char* argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}

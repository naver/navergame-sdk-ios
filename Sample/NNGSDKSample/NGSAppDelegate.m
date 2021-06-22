// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/03/11.


#import "NGSAppDelegate.h"
#import "NGSViewController.h"


@interface NGSAppDelegate ()

@end

@implementation NGSAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    window.backgroundColor = UIColor.whiteColor;
    [window setRootViewController:[[NGSViewController alloc] initWithNibName:nil bundle:nil]];
    [window makeKeyAndVisible];
    self.window = window;
    return YES;
}

@end

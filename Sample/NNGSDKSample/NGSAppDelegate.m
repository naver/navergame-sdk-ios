// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/03/11.


#import "NGSAppDelegate.h"
#import <NNGSDK/NNGSDKManager.h>
#import "NGSViewController.h"


@implementation NGSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13.0, *)) {
        
    } else {
        UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        window.backgroundColor = UIColor.whiteColor;
        [window setRootViewController:[[NGSViewController alloc] initWithNibName:nil bundle:nil]];
        [window makeKeyAndVisible];
        self.window = window;
    }
    return YES;
}


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return [NNGSDKManager.shared handleCallbackUrl:url];
}

@end

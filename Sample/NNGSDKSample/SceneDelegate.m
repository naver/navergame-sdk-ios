//
//  SceneDelegate.m
//  NNGSDKSample
//
//  Created by USER on 8/11/25.
//

#import "SceneDelegate.h"
#import <NNGSDK/NNGSDKManager.h>
#import "NGSViewController.h"

@implementation SceneDelegate

-(void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)){
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window = window;

    NGSViewController *rootVC = [[NGSViewController alloc] initWithNibName:nil bundle:nil];
    window.rootViewController = rootVC;
    [window makeKeyAndVisible];
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0)){
    for (UIOpenURLContext *context in URLContexts) {
        NSURL *url = context.URL;
        [NNGSDKManager.shared handleCallbackUrl:url];
    }
}

@end

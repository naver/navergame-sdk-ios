//
//  main.m
//  NNG SDK Sample
//
//  Created by Alan on 2021/03/11.
//

#import <UIKit/UIKit.h>
#import "NGSAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([NGSAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

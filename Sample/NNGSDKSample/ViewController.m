// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/03/11.


#import "ViewController.h"
#import <NNGSDK/NNGSDKManager.h>


@interface ViewController () <NNGSDKDelegate>

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    [NNGSDKManager.shared setClientId:@"UKvNABLDsyEJusJGsXL2"
                         clientSecret:@"rK4suc_Qd0"
                             loungeId:@"naver_game_4developer"];
    [NNGSDKManager.shared setParentViewController:self];
    NNGSDKManager.shared.delegate = self;
}


- (void)setupView {
    ^{
        UIStackView *stack = [[UIStackView alloc] init];
        stack.translatesAutoresizingMaskIntoConstraints = NO;
        stack.axis = UILayoutConstraintAxisVertical;
        stack.spacing = 10;

        [self.view addSubview:stack];

        [NSLayoutConstraint activateConstraints:@[
                [NSLayoutConstraint constraintWithItem:stack
                                             attribute:NSLayoutAttributeLeading
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeLeading
                                            multiplier:1
                                              constant:40],
                [NSLayoutConstraint constraintWithItem:stack
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1
                                              constant:40]
        ]];

        ^{
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.translatesAutoresizingMaskIntoConstraints = NO;
            button.layer.cornerRadius = 4;
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            button.layer.borderColor = UIColor.blackColor.CGColor;
            button.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.7];
            [button addTarget:self action:@selector(presentBanner:) forControlEvents:UIControlEventTouchUpInside];

            [NSLayoutConstraint activateConstraints:@[
                    [NSLayoutConstraint constraintWithItem:button
                                                 attribute:NSLayoutAttributeHeight
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1
                                                  constant:40]
            ]];

            [stack addArrangedSubview:button];

            ^{
                UILabel *label = [[UILabel alloc] init];
                label.translatesAutoresizingMaskIntoConstraints = NO;
                label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                label.textColor = UIColor.blackColor;
                label.textAlignment = NSTextAlignmentCenter;
                label.text = @"Banner";

                [button addSubview:label];

                [NSLayoutConstraint activateConstraints:@[
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:10],
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:-10],
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]
                ]];
            }();
        }();

        ^{
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.translatesAutoresizingMaskIntoConstraints = NO;
            button.layer.cornerRadius = 4;
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            button.layer.borderColor = UIColor.blackColor.CGColor;
            button.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.7];
            [button addTarget:self action:@selector(presentSorryBanner:) forControlEvents:UIControlEventTouchUpInside];

            [NSLayoutConstraint activateConstraints:@[
                    [NSLayoutConstraint constraintWithItem:button
                                                 attribute:NSLayoutAttributeHeight
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1
                                                  constant:40]
            ]];

            [stack addArrangedSubview:button];

            ^{
                UILabel *label = [[UILabel alloc] init];
                label.translatesAutoresizingMaskIntoConstraints = NO;
                label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                label.textColor = UIColor.blackColor;
                label.textAlignment = NSTextAlignmentCenter;
                label.text = @"Sorry";

                [button addSubview:label];

                [NSLayoutConstraint activateConstraints:@[
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:10],
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:-10],
                        [NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]
                ]];
            }();
        }();
    }();
}


- (void)presentBanner:(UIButton *)sender {
    [NNGSDKManager.shared presentBannerViewController];
}


- (void)presentSorryBanner:(UIButton *)sender {
    [NNGSDKManager.shared presentSorryViewController];
}


#pragma mark NNGSDKDelegte

- (void)nngSDKDidLoad {
    NSLog(@"SDK is loaded.");
}


- (void)nngSDKDidUnload {
    NSLog(@"SDK is unloaded.");
}

@end

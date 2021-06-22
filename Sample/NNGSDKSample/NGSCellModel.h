// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/06/02.


#import <Foundation/Foundation.h>


@interface NGSCellModel : NSObject

@property (strong, nonatomic, readonly) NSString *title;
@property (strong, nonatomic, readonly) NSString *value;
@property (copy, nonatomic, readonly) void (^action)(void);

+ (instancetype)itemWithTitle:(NSString *)title value:(id)value action:(void (^)(void))action;

@end

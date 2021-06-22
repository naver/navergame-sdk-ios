// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/06/02.


#import "NGSCellModel.h"


@interface NGSCellModel ()

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *value;
@property (copy, nonatomic) void (^action)(void);

@end


@implementation NGSCellModel

- (instancetype)initWithTitle:(NSString *)title value:(id)value action:(void (^)(void))action {
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    self.title = title;
    
    if (value != nil) {
        self.value = [NSString stringWithFormat:@"%@", value];
    } else {
        self.value = @"";
    }
    
    self.action = action;
    
    return self;
}


+ (instancetype)itemWithTitle:(NSString *)title value:(id)value action:(void (^)(void))action {
    return [[self alloc] initWithTitle:title value:value action:action];
}

@end

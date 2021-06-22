// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/06/02.


#import <Foundation/Foundation.h>


@interface NGSUserCache : NSObject

@property (class, nonatomic, readonly) NGSUserCache *shared;

@property (nonatomic) NSNumber *boardId;
@property (nonatomic) NSNumber *feedId;
@property (nonatomic) NSNumber *temporaryFeedId;

@end

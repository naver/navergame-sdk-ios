// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/06/02.


#import "NGSUserCache.h"


#define NGSUserCacheBoardIdKey @"NGSUserCacheBoardId"
#define NGSUserCacheFeedIdKey @"NGSUserCacheFeedId"
#define NGSUserCacheTemporaryFeedIdKey @"NGSUserCacheTemporaryFeedId"
#define NGSUserCacheBoardIdForFeedWritingKey @"NGSUserCacheBoardIdForFeedWriting"


@interface NGSUserCache ()

@property (strong, nonatomic) NSMutableDictionary<NSString *, id> *cache;

@end


@implementation NGSUserCache

+ (NGSUserCache *)shared {
    static NGSUserCache *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}


- (id)objectFor:(NSString *)key {
    id object = self.cache[key];
    
    if (object != nil) {
        return object;
    }
    
    object = [NSUserDefaults.standardUserDefaults objectForKey:key];
    
    if (object != nil) {
        self.cache[key] = object;
    }
    
    return object;
}


- (void)setObject:(id)object for:(NSString *)key {
    self.cache[key] = object;
    [NSUserDefaults.standardUserDefaults setObject:object forKey:key];
    [NSUserDefaults.standardUserDefaults synchronize];
}


- (NSNumber *)boardId {
    return [self objectFor:NGSUserCacheBoardIdKey];
}


- (void)setBoardId:(NSNumber *)boardId {
    [self setObject:boardId for:NGSUserCacheBoardIdKey];
}


- (NSNumber *)feedId {
    return [self objectFor:NGSUserCacheFeedIdKey];
}


- (void)setFeedId:(NSNumber *)feedId {
    [self setObject:feedId for:NGSUserCacheFeedIdKey];
}


- (NSNumber *)temporaryFeedId {
    return [self objectFor:NGSUserCacheTemporaryFeedIdKey];
}


- (void)setTemporaryFeedId:(NSNumber *)temporaryFeedId {
    [self setObject:temporaryFeedId for:NGSUserCacheTemporaryFeedIdKey];
}


- (NSNumber *)boardIdForFeedWriting {
    return [self objectFor:NGSUserCacheBoardIdForFeedWritingKey];
}


- (void)setBoardIdForFeedWriting:(NSNumber *)boardId {
    [self setObject:boardId for:NGSUserCacheBoardIdForFeedWritingKey];
}

@end

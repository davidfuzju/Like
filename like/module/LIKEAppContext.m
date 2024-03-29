//
//  LIKEAppContext.m
//  like
//
//  Created by David Fu on 6/16/15.
//  Copyright (c) 2015 LIKE Technology. All rights reserved.
//

#import "LIKEAppContext.h"

#import "TagView.h"

@interface LIKEAppContext ()

@end

@implementation LIKEAppContext

#pragma mark - life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return self;
}

#pragma mark - delegate methods

#pragma mark - event response

#pragma mark - private methods

#pragma mark - accessor methods

- (BOOL)isReachable {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return YES;
    } else {
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}

- (NSMutableArray *)localTagsArray {
    if (!_localTagsArray) {
        _localTagsArray = [NSMutableArray array];
    }
    return _localTagsArray;
}

- (NSMutableArray *)testTrendsArray {
    return nil;
}

//- (NSMutableArray *)testTrendsArray {
//    if (!_testTrendsArray) {
//        _testTrendsArray = [NSMutableArray array];
//        NSDictionary *text1 = @{LIKETrendUserAvatarURL: @"http://7xjvx7.com1.z0.glb.clouddn.com/m9.png",
//                                LIKETrendUserNickname: @"林星元",
//                                LIKETrendUserGender: @YES,
//                                LIKETrendUserAge: @(21),
//                                LIKETrendTimeline: [NSDate date],
//                                LIKETrendUserLocation: @"上海",
//                                LIKETrendContentImageURL: @"http://7xjljl.com1.z0.glb.clouddn.com/ef8e65a2-198d-11e5-bb92-00163e004f70",
//                                LIKETrendContentText: @"今天真是一个好天气,兄弟们,一起出来耍~",
//                                LIkeTrendContentTagList: @[@{LIKETagTitle: @"天气不错哦",
//                                                             LIKETagType: @(0),
//                                                             LIKETagDirection: @(1),
//                                                             LIKETagPosition: @"{100, 100}"
//                                                             }]
//                                };
//        
//        NSDictionary *text2 = @{LIKETrendUserAvatarURL: @"http://7xjvx7.com1.z0.glb.clouddn.com/m2.png",
//                                LIKETrendUserNickname: @"张力泳",
//                                LIKETrendUserGender: @YES,
//                                LIKETrendUserAge: @(23),
//                                LIKETrendTimeline: [NSDate date],
//                                LIKETrendUserLocation: @"上海",
//                                LIKETrendContentImageURL: @"http://7xjljl.com1.z0.glb.clouddn.com/eeefa9c6-198d-11e5-bb92-00163e004f70",
//                                LIKETrendContentText: @"今天遇到一个不错的姑娘,可惜错过了,希望下次不会有下次,大家也都要抓住机会,不要放过",
//                                LIkeTrendContentTagList: @[@{LIKETagTitle: @"我了个草不",
//                                                             LIKETagType: @(0),
//                                                             LIKETagDirection: @(1),
//                                                             LIKETagPosition: @"{150, 150}"
//                                                             }]
//                                };
//        
//        NSDictionary *text3 = @{LIKETrendUserAvatarURL: @"http://7xjvx7.com1.z0.glb.clouddn.com/f6.png",
//                                LIKETrendUserNickname: @"宋慈玉",
//                                LIKETrendUserGender: @NO,
//                                LIKETrendUserAge: @(25),
//                                LIKETrendTimeline: [NSDate date],
//                                LIKETrendUserLocation: @"上海",
//                                LIKETrendContentImageURL: @"http://7xjljl.com1.z0.glb.clouddn.com/f06ec084-198d-11e5-bb92-00163e004f70",
//                                LIKETrendContentText: @"有人一块看电影么,人家最近有空哦~",
//                                LIkeTrendContentTagList: @[@{LIKETagTitle: @"左边",
//                                                             LIKETagType: @(0),
//                                                             LIKETagDirection: @(0),
//                                                             LIKETagPosition: @"{120, 150}"
//                                                             },
//                                                           @{LIKETagTitle: @"右边",
//                                                             LIKETagType: @(0),
//                                                             LIKETagDirection: @(1),
//                                                             LIKETagPosition: @"{200, 150}"
//                                                             }
//                                                           ]
//                                };
//        
//        [_testTrendsArray addObject:text1];
//        [_testTrendsArray addObject:text2];
//        [_testTrendsArray addObject:text3];
//    }
//    return _testTrendsArray;
//}

- (NSMutableArray *)testUploadTrendsArray {
    if (!_testUploadTrendsArray) {
        _testUploadTrendsArray = [NSMutableArray array];
    }
    return _testUploadTrendsArray;
}

- (NSString *)username {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
}

- (void)setUsername:(NSString *)username {
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)password {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
}

- (void)setPassword:(NSString *)password {
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isAutoLogin {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"isAutoLogin"] boolValue];
}

- (void)setIsAutoLogin:(BOOL)isAutoLogin {
    [[NSUserDefaults standardUserDefaults] setObject:@(isAutoLogin) forKey:@"isAutoLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)hasWelcomeNewUser {
    NSString *hasWelcomeNewUserKey = [NSString stringWithFormat:@"hasWelcomeNewUser_%@", getAppVersion()];
    return [[[NSUserDefaults standardUserDefaults] objectForKey:hasWelcomeNewUserKey] boolValue];
}

- (void)setHasWelcomeNewUser:(BOOL)hasWelcomeNewUser {
    NSString *hasWelcomeNewUserKey = [NSString stringWithFormat:@"hasWelcomeNewUser_%@", getAppVersion()];
    [[NSUserDefaults standardUserDefaults] setObject:@(hasWelcomeNewUser) forKey:hasWelcomeNewUserKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - api methods

+ (instancetype)sharedInstance {
    static LIKEAppContext *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LIKEAppContext alloc] init];
    });
    return sharedInstance;
}

@end

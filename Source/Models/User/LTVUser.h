//
//  LTVUser.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"

@interface LTVUser : LTVObject

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *slug;
@property (nonatomic, strong, readonly) NSString *country;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSString *favoriteProgrammingLanguage;
@property (nonatomic, strong, readonly) NSString *favoriteIDE;
@property (nonatomic, strong, readonly) NSString *favoriteCodingBackgroundMusic;
@property (nonatomic, strong, readonly) NSString *favoriteCode;
@property (nonatomic, readonly) NSInteger yearsProgramming;
@property (nonatomic, strong, readonly) NSString *wantLearn;
@property (nonatomic, strong, readonly) NSString *registrationDateString;
@property (nonatomic, strong, readonly) NSString *timezone;

+ (void)getUserWithHandler:(void (^)(NSString *errorMessage, LTVUser *user))handler;

- (void)getFollowersWithHandler:(void (^)(NSString *errorMessage, NSArray *followers))handler;
- (void)getFollowsWithHandler:(void (^)(NSString *errorMessage, NSArray *follows))handler;
- (void)getVideosWithHandler:(void (^)(NSString *errorMessage, NSArray *videos))handler;

@end

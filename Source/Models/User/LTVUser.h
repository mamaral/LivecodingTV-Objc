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

+ (void)getUserWithSlug:(NSString *)slug handler:(void (^)(NSError *error, LTVUser *user))handler;

- (void)getFollowersWithHandler:(void (^)(NSError *error, NSArray *followers))handler;
- (void)getFollowsWithHandler:(void (^)(NSError *error, NSArray *follows))handler;
- (void)getVideosWithHandler:(void (^)(NSError *error, NSArray *videos))handler;

@end

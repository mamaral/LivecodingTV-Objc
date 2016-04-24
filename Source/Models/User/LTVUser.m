//
//  LTVUser.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVUser.h"

@implementation LTVUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];

    if (self == nil) {
        return nil;
    }

    _username = dictionary[@"username"];
    _slug = dictionary[@"slug"];
    _country = dictionary[@"country"];
    _city = dictionary[@"city"];
    _favoriteProgrammingLanguage = dictionary[@"favorite_programming"];
    _favoriteIDE = dictionary[@"favorite_ide"];
    _favoriteCodingBackgroundMusic = dictionary[@"favorite_coding_background_music"];
    _favoriteCode = dictionary[@"favorite_code"];
    _yearsProgramming = [dictionary[@"years_programming"] integerValue];
    _wantLearn = dictionary[@"want_learn"];
    _registrationDateString = dictionary[@"registration_date"];
    _timezone = dictionary[@"timezone"];

    return self;
}


#pragma mark - Requests

+ (void)getUserWithHandler:(void (^)(NSString *errorMessage, LTVUser *user))handler {

}

- (void)getFollowersWithHandler:(void (^)(NSString *errorMessage, NSArray *followers))handler {

}

- (void)getFollowsWithHandler:(void (^)(NSString *errorMessage, NSArray *follows))handler {

}

- (void)getVideosWithHandler:(void (^)(NSString *errorMessage, NSArray *videos))handler {

}

@end

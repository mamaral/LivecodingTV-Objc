//
//  LTVUser.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVUser.h"
#import "LTVRequestManager.h"

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

+ (void)getUserWithSlug:(NSString *)slug handler:(void (^)(NSError *error, LTVUser *user))handler {
    NSParameterAssert(slug);
    NSParameterAssert(handler);

    NSString *route = [NSString stringWithFormat:@"users/%@", slug];

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:route params:nil handler:^(NSError *error, id responseObject) {
        if (error) {
            handler(error, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        LTVUser *video = [[LTVUser alloc] initWithDictionary:responseDict];

        handler(nil, video);
    }];
}

- (void)getFollowersWithHandler:(void (^)(NSError *error, NSArray *followers))handler {

}

- (void)getFollowsWithHandler:(void (^)(NSError *error, NSArray *follows))handler {

}

- (void)getVideosWithHandler:(void (^)(NSError *error, NSArray *videos))handler {

}

@end

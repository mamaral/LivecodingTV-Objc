//
//  LTVLiveStream.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVLivestream.h"
#import "LTVRequestManager.h"

@implementation LTVLivestream

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];

    if (self == nil) {
        return nil;
    }

    _user = dictionary[@"user"];
    _userSlug = dictionary[@"user_slug"];
    _title = dictionary[@"title"];
    _streamDescription = dictionary[@"description"];
    _codingCategory = dictionary[@"coding_category"];
    _difficulty = [self difficultyFromString:dictionary[@"difficulty"]];
    _language = dictionary[@"language"];
    _tags = dictionary[@"tags"];
    _isLive = [dictionary[@"is_live"] boolValue];
    _viewersLive = [dictionary[@"viewers_live"] integerValue];
    _viewingURLs = dictionary[@"viewing_urls"];

    return self;
}


#pragma mark - Requests

+ (void)getOnAirLivestreamsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSString *errorMessage, NSArray *streams))handler {
    NSString *livestreamRoute = @"livestreams/onair";
    NSDictionary *params = @{@"limit": @(limit), @"offset": @(offset)};

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:livestreamRoute params:params handler:^(NSString *errorMessage, id responseObject) {
        if (errorMessage) {
            handler(errorMessage, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *resultsArray = responseDict[@"results"];
        NSMutableArray *livestreams = [NSMutableArray arrayWithCapacity:resultsArray.count];

        for (NSDictionary *resultDict in resultsArray) {
            LTVLivestream *livestream = [[LTVLivestream alloc] initWithDictionary:resultDict];

            if (livestream) {
                [livestreams addObject:livestream];
            }
        }

        handler(nil, livestreams);
    }];
}

+ (void)getLivestreamsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSString *errorMessage, NSArray *streams))handler {
    NSString *livestreamRoute = @"livestreams";
    NSDictionary *params = @{@"limit": @(limit), @"offset": @(offset)};

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:livestreamRoute params:params handler:^(NSString *errorMessage, id responseObject) {
        if (errorMessage) {
            handler(errorMessage, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *resultsArray = responseDict[@"results"];
        NSMutableArray *livestreams = [NSMutableArray arrayWithCapacity:resultsArray.count];

        for (NSDictionary *resultDict in resultsArray) {
            LTVLivestream *livestream = [[LTVLivestream alloc] initWithDictionary:resultDict];

            if (livestream) {
                [livestreams addObject:livestream];
            }
        }

        handler(nil, livestreams);
    }];
}

@end

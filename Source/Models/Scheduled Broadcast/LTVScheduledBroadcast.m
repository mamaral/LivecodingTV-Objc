//
//  LTVScheduledBroadcast.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVScheduledBroadcast.h"
#import "LTVRequestManager.h"

@implementation LTVScheduledBroadcast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];

    if (self == nil) {
        return nil;
    }

    _broadcastID = [dictionary[@"id"] integerValue];
    _title = dictionary[@"title"];
    _livestream = dictionary[@"livestream"];
    _codingCategory = dictionary[@"coding_category"];
    _difficulty = [self difficultyFromString:dictionary[@"difficulty"]];
    _startTimeString = dictionary[@"start_time"];
    _startTimeOriginalTimezone = dictionary[@"start_time_original_timezone"];
    _originalTimezone = dictionary[@"original_timezone"];
    _isFeatured = [dictionary[@"is_featured"] boolValue];
    _isRecurring = [dictionary[@"is_recurring"] boolValue];

    return self;
}


#pragma mark - Requests

+ (void)getScheduledBroadcastsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSError *error, NSArray *broadcasts))handler {
    NSParameterAssert(handler);

    NSString *route = @"scheduledbroadcasts";
    NSDictionary *params = @{@"limit": @(limit), @"offset": @(offset)};

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:route params:params handler:^(NSError *error, id responseObject) {
        if (error) {
            handler(error, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *resultsArray = responseDict[@"results"];
        NSMutableArray *broadcasts = [NSMutableArray arrayWithCapacity:resultsArray.count];

        for (NSDictionary *resultDict in resultsArray) {
            LTVScheduledBroadcast *broadcast = [[LTVScheduledBroadcast alloc] initWithDictionary:resultDict];

            if (broadcast) {
                [broadcasts addObject:broadcast];
            }
        }

        handler(nil, broadcasts);
    }];
}

@end

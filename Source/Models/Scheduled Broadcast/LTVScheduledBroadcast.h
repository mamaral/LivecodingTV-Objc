//
//  LTVScheduledBroadcast.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"
#import "LTVAPI.h"

@interface LTVScheduledBroadcast : LTVObject

@property (nonatomic, readonly) NSInteger broadcastID;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *livestream;
@property (nonatomic, strong, readonly) NSString *codingCategory;
@property (nonatomic, readonly) LTVDifficulty difficulty;
@property (nonatomic, strong, readonly) NSString *startTimeString;
@property (nonatomic, strong, readonly) NSString *startTimeOriginalTimezone;
@property (nonatomic, strong, readonly) NSString *originalTimezone;
@property (nonatomic, readonly) BOOL isFeatured;
@property (nonatomic, readonly) BOOL isRecurring;

+ (void)getScheduledBroadcastsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSError *error, NSArray *broadcasts))handler;

@end

//
//  LTVLiveStream.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"

@interface LTVLivestream : LTVObject

@property (nonatomic, strong, readonly) NSString *user;
@property (nonatomic, strong, readonly) NSString *userSlug;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *streamDescription;
@property (nonatomic, strong, readonly) NSString *codingCategory;
@property (nonatomic, strong, readonly) NSString *difficulty;
@property (nonatomic, strong, readonly) NSString *language;
@property (nonatomic, strong, readonly) NSString *tags;
@property (nonatomic, readonly) BOOL isLive;
@property (nonatomic, readonly) NSInteger viewersLive;
@property (nonatomic, strong, readonly) NSArray *viewingURLs;

+ (void)getOnAirLivestreamsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSString *errorMessage, NSArray *streams))handler;
+ (void)getLivestreamsWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSString *errorMessage, NSArray *streams))handler;

@end

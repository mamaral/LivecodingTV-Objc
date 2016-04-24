//
//  LTVVideo.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"
#import "LTVAPI.h"
#import <UIKit/UIKit.h>

@interface LTVVideo : LTVObject

@property (nonatomic, strong, readonly) NSString *slug;
@property (nonatomic, strong, readonly) NSString *user;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *videoDescription;
@property (nonatomic, strong, readonly) NSString *codingCategory;
@property (nonatomic, readonly) LTVDifficulty difficulty;
@property (nonatomic, strong, readonly) NSString *language;
@property (nonatomic, readonly) LTVProductType productType;
@property (nonatomic, strong, readonly) NSString *creationTime;
@property (nonatomic, readonly) NSInteger duration;
@property (nonatomic, readonly) LTVRegion region;
@property (nonatomic, readonly) NSInteger viewersOverall;
@property (nonatomic, strong, readonly) NSArray *viewingURLs;


- (UIImage *)generateVideoThumbnail;

+ (void)getVideosWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSError *error, NSArray *videos))handler;
+ (void)getVideoWithSlug:(NSString *)slug handler:(void (^)(NSError *error, LTVVideo *video))handler;

@end

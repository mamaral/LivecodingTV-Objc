

//
//  LTVVideo.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVVideo.h"
#import "LTVRequestManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation LTVVideo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];

    if (self == nil) {
        return nil;
    }

    _user = dictionary[@"user"];
    _slug = dictionary[@"slug"];
    _title = dictionary[@"title"];
    _videoDescription = dictionary[@"description"];
    _codingCategory = dictionary[@"coding_category"];
    _difficulty = dictionary[@"difficulty"];
    _language = dictionary[@"language"];
    _productType = [self productTypeFromString:dictionary[@"product_type"]];
    _creationTime = dictionary[@"creation_time"];
    _duration = [dictionary[@"duration"] integerValue];
    _region = [self regionFromString:dictionary[@"region"]];
    _viewersOverall = [dictionary[@"viewers_overall"] integerValue];
    _viewingURLs = dictionary[@"viewing_urls"];

    return self;
}

- (LTVProductType)productTypeFromString:(NSString *)string {
    if ([string isEqualToString:@"game"]) {
        return LTVProductTypeGame;
    } else if ([string isEqualToString:@"app"]) {
        return LTVProductTypeApp;
    } else if ([string isEqualToString:@"website"]) {
        return LTVProductTypeWebsite;
    } else if ([string isEqualToString:@"codetalk"]) {
        return LTVProductTypeCodeTalk;
    } else {
        return LTVProductTypeOther;
    }
}

- (LTVRegion)regionFromString:(NSString *)string {
    if ([string isEqualToString:@"us-stlouis"]) {
        return LTVRegionStLouis;
    } else if ([string isEqualToString:@"eu-london"]) {
        return LTVRegionLondon;
    } else {
        return LTVRegionOther;
    }
}


#pragma mark - Thumbnail generation

- (UIImage *)generateVideoThumbnail {
    if (!self.url) {
        return nil;
    }

    AVURLAsset *assetFromURL = [[AVURLAsset alloc] initWithURL:self.url options:nil];
    AVAssetImageGenerator *assetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:assetFromURL];
    assetImageGenerator.appliesPreferredTrackTransform = YES;

    NSError *error = nil;
    CGImageRef thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(1, 2) actualTime:NULL error:&error];

    if (!thumbnailImageRef) {
        NSLog(@"Error generating thumbnail: %@", error.localizedDescription);
        return nil;
    }

    return [[UIImage alloc] initWithCGImage:thumbnailImageRef];
}


#pragma mark - Requests

+ (void)getVideosWithOffset:(NSInteger)offset limit:(NSInteger)limit handler:(void (^)(NSString *errorMessage, NSArray *videos))handler {
    NSParameterAssert(handler);

    NSString *route = @"videos";
    NSDictionary *params = @{@"limit": @(limit), @"offset": @(offset)};

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:route params:params handler:^(NSString *errorMessage, id responseObject) {
        if (errorMessage) {
            handler(errorMessage, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *resultsArray = responseDict[@"results"];
        NSMutableArray *videos = [NSMutableArray arrayWithCapacity:resultsArray.count];

        for (NSDictionary *resultDict in videos) {
            LTVVideo *video = [[LTVVideo alloc] initWithDictionary:resultDict];

            if (video) {
                [videos addObject:video];
            }
        }

        handler(nil, videos);
    }];
}

+ (void)getVideoWithSlug:(NSString *)slug handler:(void (^)(NSString *errorMessage, LTVVideo *video))handler {
    NSParameterAssert(slug);
    NSParameterAssert(handler);

    NSString *route = [NSString stringWithFormat:@"videos/%@", slug];

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:route params:nil handler:^(NSString *errorMessage, id responseObject) {
        if (errorMessage) {
            handler(errorMessage, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        LTVVideo *video = [[LTVVideo alloc] initWithDictionary:responseDict];

        handler(nil, video);
    }];
}

@end

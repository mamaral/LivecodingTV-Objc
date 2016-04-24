//
//  LTVObject.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"

@implementation LTVObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    NSString *urlString = dictionary[@"url"];
    _url = urlString ? [NSURL URLWithString:urlString] : nil;

    return self;
}


#pragma mark - Conversions

- (LTVDifficulty)difficultyFromString:(NSString *)string {
    if ([string isEqualToString:@"beginner"]) {
        return LTVDifficultyBeginner;
    } else if ([string isEqualToString:@"intermediate"]) {
        return LTVDifficultyIntermediate;
    } else if ([string isEqualToString:@"expert"]) {
        return LTVDifficultyExpert;
    } else {
        return LTVDifficultyOther;
    }
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


@end

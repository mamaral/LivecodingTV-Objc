//
//  LTVObject.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LTVDifficulty) {
    LTVDifficultyBeginner = 0,
    LTVDifficultyIntermediate,
    LTVDifficultyExpert,
    LTVDifficultyOther
};

typedef NS_ENUM(NSUInteger, LTVProductType) {
    LTVProductTypeGame = 0,
    LTVProductTypeApp,
    LTVProductTypeWebsite,
    LTVProductTypeCodeTalk,
    LTVProductTypeOther
};

typedef NS_ENUM(NSUInteger, LTVRegion) {
    LTVRegionStLouis = 0,
    LTVRegionLondon,
    LTVRegionOther
};

@interface LTVObject : NSObject

@property (nonatomic, strong, readonly) NSURL *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (LTVDifficulty)difficultyFromString:(NSString *)string;
- (LTVProductType)productTypeFromString:(NSString *)string;
- (LTVRegion)regionFromString:(NSString *)string;

@end

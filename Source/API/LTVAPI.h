//
//  LTVAPI.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LTVDifficulty) {
    LTVDifficultyBeginner = 0,
    LTVDifficultyIntermediate,
    LTVDifficultyExpert
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


@interface LTVAPI : NSObject

+ (instancetype)setupWithAPIKey:(NSString *)apiKey;

@end

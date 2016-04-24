//
//  LTVAPI.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVAPI.h"
#import "LTVRequestManager.h"

@implementation LTVAPI

+ (instancetype)setupWithAPIKey:(NSString *)apiKey {
    return [[self alloc] initWithAPIKey:apiKey];
}

- (instancetype)initWithAPIKey:(NSString *)apiKey {
    NSParameterAssert(apiKey);

    self = [super init];

    if (self == nil) {
        return nil;
    }

    [LTVRequestManager sharedInstance].apiKey = apiKey;

    return self;
}

@end

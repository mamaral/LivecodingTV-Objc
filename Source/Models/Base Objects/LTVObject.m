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


@end

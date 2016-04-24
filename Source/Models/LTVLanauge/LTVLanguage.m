//
//  LTVLanguage.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVLanguage.h"
#import "LTVRequestManager.h"

@implementation LTVLanguage

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];

    if (self == nil) {
        return nil;
    }

    _name = dictionary[@"name"];

    return self;
}


#pragma mark - Requests

+ (void)getLanguagesWithHandler:(void (^)(NSString *errorMessage, NSArray *languages))handler {
    NSParameterAssert(handler);

    NSString *route = @"languages";

    [[LTVRequestManager sharedInstance] sendGETRequestToRoute:route params:nil handler:^(NSString *errorMessage, id responseObject) {
        if (errorMessage) {
            handler(errorMessage, nil);
            return;
        }

        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *resultsArray = responseDict[@"results"];
        NSMutableArray *languageObjects = [NSMutableArray arrayWithCapacity:resultsArray.count];

        for (NSDictionary *resultDict in resultsArray) {
            LTVLanguage *language = [[LTVLanguage alloc] initWithDictionary:resultDict];

            if (language) {
                [languageObjects addObject:language];
            }
        }

        handler(nil, languageObjects);
    }];
}

@end

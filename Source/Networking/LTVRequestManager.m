//
//  LTVRequestManager.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVRequestManager.h"
#import <AFHTTPSessionManager.h>


static NSString * const kLivecodingTVBaseURLString = @"https://www.livecoding.tv/api/";

@implementation LTVRequestManager


#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });

    return _sharedObject;
}


#pragma mark Initialization

- (instancetype)init {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kLivecodingTVBaseURLString]];
    
    return self;
}


#pragma mark - Sending requests

- (void)sendGETRequestToRoute:(NSString *)route params:(NSDictionary *)params handler:(void (^)(NSString *errorMessage, id responseObject))handler {
    [self.manager GET:route parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"asdfadsf");
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"asdfadsf");
    }];
}


#pragma mark - Utilities

- (NSDictionary *)params {
    return @{};
}

@end

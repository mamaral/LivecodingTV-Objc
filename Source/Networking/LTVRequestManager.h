//
//  LTVRequestManager.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface LTVRequestManager : NSObject


@property (nonatomic, strong, readonly) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSString *apiKey;


+ (instancetype)sharedInstance;


- (void)sendGETRequestToRoute:(NSString *)route params:(NSDictionary *)params handler:(void (^)(NSString *errorMessage, id responseObject))handler;

@end

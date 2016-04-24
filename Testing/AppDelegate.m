//
//  AppDelegate.m
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "AppDelegate.h"
#import "LTVLivestream.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new];

    [LTVLivestream getLivestreamsWithOffset:0 limit:100 handler:^(NSString *errorMessage, NSArray *streams) {
        
    }];

    [self.window makeKeyAndVisible];

    return YES;
}

@end

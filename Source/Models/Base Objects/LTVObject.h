//
//  LTVObject.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTVObject : NSObject

@property (nonatomic, strong, readonly) NSURL *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

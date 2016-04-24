//
//  LTVLanguage.h
//  LivecodingTV-ObjC
//
//  Created by Mike on 4/23/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#import "LTVObject.h"

@interface LTVLanguage : LTVObject

@property (nonatomic, strong, readonly) NSString *name;

+ (void)getLanguagesWithHandler:(void (^)(NSString *errorMessage, NSArray *languages))handler;

@end

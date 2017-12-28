//
//  AppHelper.h
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface AppHelper : NSObject

+ (void)setCurrentConfig:(NSString *)envKey;

+ (NSString *)currentConfigKey;

-(NSString *)getAjaxUrl:(NSString *)route;

-(NSString *)getZaggleUrl:(NSString *)route;

-(NSString *)getPosUrl:(NSString *)route;



@end

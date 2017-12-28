//
//  AjaxHelper.h
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppHelper.h"

@interface AjaxHelper : NSObject <NSURLSessionDelegate, NSURLSessionDataDelegate>

-(void)ajax:(NSString *)route :(NSString *)type :(NSMutableDictionary *)data :(void (^)(id))successClosure :(void (^)(id))failureClosure;

@end

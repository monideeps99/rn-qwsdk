//
//  ActivityHelper.h
//  QWCore_ios_CONSUMER
//
//  Created by Monideep Purkayastha on 20/11/15.
//  Copyright © 2015 LivQuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QWActivityHelper : NSObject

+ (void) displayActivityIndicator : (UIView *) mainView;
+ (void) removeActivityIndicator : (UIView *) mainView;

@end

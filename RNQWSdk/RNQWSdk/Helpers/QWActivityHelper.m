//
//  ActivityHelper.m
//  QWCore_ios_CONSUMER
//
//  Created by Monideep Purkayastha on 20/11/15.
//  Copyright © 2015 LivQuik. All rights reserved.
//

#import "QWActivityHelper.h"

@implementation QWActivityHelper

+ (void) displayActivityIndicator: (UIView *) mainView{
    // get window screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //create a new view with the same size
    UIView* overlay = [[UIView alloc] initWithFrame:screenRect];
    // change background color and opacity
    overlay.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent: 0.4];
    // Assign a tag to overlay view
    overlay.tag = 20;
    
    // Create a UIActivityIndicator and add it to overlay view
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(150, 200, 30, 30)];
    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [spinner setColor: [UIColor whiteColor]];
    spinner.center = overlay.center;
    
    [overlay addSubview:spinner];
    [spinner startAnimating];
    
    // Add the overlay view to main view
    [mainView addSubview:overlay];
}

+ (void) removeActivityIndicator : (UIView *) mainView {
    UIView *overlay = [mainView viewWithTag:20];
    [overlay removeFromSuperview];
}

@end

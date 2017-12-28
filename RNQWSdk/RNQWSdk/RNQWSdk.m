//
//  RNQWSdk.m
//  RNQWSdk
//
//  Created by Deep on 26/12/17.
//  Copyright © 2017 QuikWallet. All rights reserved.
//

#import "RNQWSdk.h"
#import <React/RCTLog.h>
#import "QRPayViewController.h"
#import "QWSdk.h"

@implementation RNQWSdk

// To export a module named CalendarManager
RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"QWCallback"];
}

RCT_EXPORT_METHOD(test:(NSString *)name)
{
    RCTLogInfo(@"Hello %@", name);
}

RCT_EXPORT_METHOD(init:( id )data)
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNotification:) name:@"QWSUCCESS" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNotification:) name:@"QWFAILURE" object:nil];
    
    NSMutableDictionary *incoming = [[NSMutableDictionary alloc] initWithDictionary: (NSDictionary *) data];
    [QuikWallet setDefaultConfig:[incoming objectForKey:@"env"]];
    QRPayViewController *qrPay = [[QRPayViewController alloc] init];
    qrPay.data = incoming;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:qrPay];
    
    // nav.navigationBar.barTintColor = [UIColor colorWithRed:0.89 green:0.00 blue:0.10 alpha:1.0];
    // nav.navigationBar.tintColor = [UIColor whiteColor];
    // [nav.navigationBar
    // setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //nav.navigationBar.translucent = NO;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[[nav navigationBar] setBarStyle:UIStatusBarStyleLightContent];
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:nav animated:YES completion:nil];
}

- (void)didReceivedNotification:(NSNotification *)notification
{
    NSLog(@"[INFO] Notification received");
    NSDictionary *userInfo = [notification userInfo];
    
    [self sendEventWithName:@"QWCallback" body:userInfo];
}

@end

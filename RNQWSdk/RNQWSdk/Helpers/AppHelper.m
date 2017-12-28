//
//  AppHelper.m
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import "AppHelper.h"
#import "QWSdk.h"

static NSString *QWCurrentConfigKey;

@implementation AppHelper

+ (void)setCurrentConfig:(NSString *)envKey {
        QWCurrentConfigKey = envKey;
    NSLog(@"QWCURRENTKEY %@", QWCurrentConfigKey);
}

+ (NSString *)currentConfigKey {
    return QWCurrentConfigKey;
}

-(NSString *)getZaggleUrl:(NSString *)route
{
    return [NSString stringWithFormat:@"%@/%@/%@",[self getBasicUrl],ENDPOINT_ZAGGLE_PREFIX,route];
}

-(NSString *)getAjaxUrl:(NSString *)route
{
    return [NSString stringWithFormat:@"%@/%@/%@",[self getBasicUrl],ENDPOINT_PREFIX,route];
}

-(NSString *)getPosUrl:(NSString *)route
{
    return [NSString stringWithFormat:@"%@/%@/%@",[self getBasicUrl],ENDPOINT_POS_PREFIX,route];
}


-(NSString *)getBasicUrl
{
    NSString * current_config = [AppHelper currentConfigKey];
    
    NSString *protocol = [current_config isEqualToString:CONFIG_DEV] ? @"http" : @"https";
    
    NSString *hostname;
    
    if ([current_config isEqualToString: CONFIG_DEV]) {
        hostname = SERVER_URL_DEV;
    }
    else if ([current_config isEqualToString: CONFIG_UAT])
    {
        hostname = SERVER_URL_UAT;
    }
    else if ([current_config isEqualToString: CONFIG_LIVE])
    {
        hostname = SERVER_URL_LIVE;
    }
    else if ([current_config isEqualToString: CONFIG_STAGING]){
        hostname = SERVER_URL_STAGING;
    }
    else if ([current_config isEqualToString: CONFIG_TEST]){
        hostname = SERVER_URL_TEST;
    }
    else
    {
        hostname = SERVER_URL_LIVE;
    }
    
    NSString *port = [current_config isEqualToString: CONFIG_DEV] ? [NSString stringWithFormat:@":%@",SERVER_PORT_DEV]:@"";
    return [NSString stringWithFormat:@"%@://%@%@",protocol,hostname,port];
}

@end

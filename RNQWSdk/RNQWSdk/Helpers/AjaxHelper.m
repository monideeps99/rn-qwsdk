//
//  AjaxHelper.m
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import "AjaxHelper.h"
#import <React/RCTLog.h>

@implementation AjaxHelper

-(void)ajax:(NSString *)route :(NSString *)type :(NSMutableDictionary *)data :(void (^)(id))successClosure :(void (^)(id))failureClosure{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

    // Set request timeout
    if ([route isEqualToString:ENDPOINT_PAY]) {
        configuration.timeoutIntervalForRequest = 180.0;
        configuration.timeoutIntervalForResource = 180.0;
    }else{
        configuration.timeoutIntervalForRequest = 60.0;
        configuration.timeoutIntervalForResource = 60.0;
    }


    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];

    AppHelper *appHelper = [[AppHelper alloc] init];
    NSString *url = [appHelper getZaggleUrl:route];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];

    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField: @"Accept"];

    if ([type isEqualToString:TYPE_POST]) {

        [request setHTTPMethod:TYPE_POST];

        [data setObject:@"ios" forKey:@"platform"];
        [data setObject:SDK_VERSION forKey:@"sdkversion"];

        NSLog(@"[INFO] URL : %@", url);
        NSLog(@"[INFO] DATA : %@", data);

        NSError *error;

        NSDictionary *mapData = [[NSDictionary alloc] initWithDictionary:data];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];

        [request setHTTPBody: postData];
    } else if( [type isEqualToString:TYPE_GET]){

        [request setHTTPMethod:TYPE_GET];
        NSLog(@"[INFO] URL : %@", url);
    }

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (error) {
            NSLog(@"[ERROR] FAILURE MAKING AJAX CALL: %@",error);

            dispatch_async(dispatch_get_main_queue(), ^{
                failureClosure(error);
            });

        }else{
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:NULL];
            NSLog(@"[INFO] JSON RESPONSE: %@", json);

            if (!json) {
                NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : QWJSONParsingErrorKey};

                NSError *error = [[NSError alloc] initWithDomain:QWDomain code:QWAPIError userInfo:userInfo];
                NSLog(@"[ERROR] ERROR %@", error);

                dispatch_async(dispatch_get_main_queue(), ^{
                    failureClosure(error);
                });
            } else if ([(NSHTTPURLResponse *) response statusCode] == 200){

                if ([[json objectForKey:@"status"] isEqualToString:STATUS_SUCCESS]) {

                    // Handle success
                    NSDictionary *response = [json objectForKey:@"data"];
                    NSMutableDictionary *responseObject = [[NSMutableDictionary alloc] initWithDictionary: response];

                    dispatch_async(dispatch_get_main_queue(), ^{
                        successClosure(responseObject);
                    });

                } else if ([[json objectForKey:@"status"] isEqualToString:STATUS_FAILED]){
                    // Handle failure
                    NSString *message;

                    if (!IsEmpty([json objectForKey:@"message"])) {
                        message = [json objectForKey:@"message"];
                    } else if(!IsEmpty([json objectForKey:@"message"])){
                        message = [[json objectForKey:@"data"] objectForKey:@"message"];
                    } else{
                        message = QWUnexpectedError;
                    }

                    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message};

                    NSError *error = [[NSError alloc] initWithDomain:QWDomain code:QWAPIError userInfo:userInfo];
                    NSLog(@"[ERROR] ERROR %@", error);

                    dispatch_async(dispatch_get_main_queue(), ^{
                        failureClosure(error);
                    });
                }

            } else{
                NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : [json objectForKey:@"message"],};

                NSError *error = [[NSError alloc] initWithDomain:QWDomain code:QWAPIError userInfo:userInfo];
                NSLog(@"[ERROR] ERROR %@", error);

                dispatch_async(dispatch_get_main_queue(), ^{
                    failureClosure(error);
                });
            }
        }

    }];

    [task resume];
}

static inline BOOL IsEmpty(id thing) {
    return thing == nil
    || ([thing isEqual:[NSNull null]]) //JS addition for coredata
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

@end

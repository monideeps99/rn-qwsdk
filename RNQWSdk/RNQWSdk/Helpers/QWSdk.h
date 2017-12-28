//
//  QWSdk.h
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuikWallet : NSObject

+ (void)setDefaultConfig:(NSString *)envKey;
+ (NSString *)defaultConfigKey ;

@end


@interface QWSdk : NSObject

// Cards API
-(void) getCards:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) addPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) deleteCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) changeDefaultCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

// Payments API
-(void)getrequestedpayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;
-(void) rejectPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) cancelPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) dropPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) rechargePrepaidCardUsingSavedPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) rechargePrepaidCardUsingNewPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) findModesOfPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) getHowYouPaid:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) paymentUsingSavedPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) paymentUsingNewPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) paymentUsingNetBanking:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) rechargePrepaidCardUsingNetBanking:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void)getTransactionHistory:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void)getTransactionDetails:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void)getPaymentByHash:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) paymentFulfilledRequest: (NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) genericPostRequest: (NSString *) route :(NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) genericGetRequest: (NSString *) route :(NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

- (void) requestBill:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure;

- (void) pendingPayments:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure;

// Places API

-(void) getPlaces: (NSMutableDictionary *) data : (void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

-(void) reportIssue: (NSMutableDictionary *) data : (void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure;

- (void) checkin:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure;

- (void) checkout:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure;

- (void) feedback:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure;

@end

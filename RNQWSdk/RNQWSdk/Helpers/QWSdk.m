//
//  QWSdk.m
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import "QWSdk.h"
#import "AppHelper.h"
#import "AjaxHelper.h"
#import "Constants.h"

static NSString *QWDefaultConfigKey;
static NSString *QWtoken;
static NSString *QWDeviceId;

@implementation QuikWallet

+ (void)setDefaultConfig:(NSString *)envKey {
    QWDefaultConfigKey = envKey;
}

+ (NSString *)defaultConfigKey {
    return QWDefaultConfigKey;
}

@end

@implementation QWSdk

- (instancetype)init {
    NSLog(@"INIT WITH KEY %@", [QuikWallet defaultConfigKey]);
    
    return [self initWithDefaultConfigKey:[QuikWallet defaultConfigKey]];
}

- (instancetype)initWithDefaultConfigKey:(NSString *)envKey {
    self = [super init];
    if (self) {
        [AppHelper setCurrentConfig:envKey];
    }
    return self;
}

// Cards API
-(void) getCards:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_CARDS : TYPE_POST :data :success :failure];
}

-(void) addPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_ADDCARD : TYPE_POST :data :success :failure];
}

-(void) deleteCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_DELETE_CARD : TYPE_POST :data :success :failure];
}

-(void) changeDefaultCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_CHANGE_DEFAULT_CARD : TYPE_POST :data :success :failure];
}

// Payments API
-(void)getrequestedpayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_GETREQUESTEDPAYMENT : TYPE_POST :data :success :failure];
}

-(void)rejectPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_REJECTPAYMENTS : TYPE_POST :data :success :failure];
}

-(void)cancelPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_CANCELPAYMENT : TYPE_POST :data :success :failure];
}

-(void)dropPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_DROPPAYMENT : TYPE_POST :data :success :failure];
}

-(void)rechargePrepaidCardUsingSavedPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_RECHARGE : TYPE_POST :data :success :failure];
}

-(void)rechargePrepaidCardUsingNewPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_RECHARGE : TYPE_POST :data :success :failure];
}

-(void)findModesOfPayment:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_HOWTOPAY : TYPE_POST :data :success :failure];
}

-(void)getHowYouPaid:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_HOWYOUPAID : TYPE_POST :data :success :failure];
}

-(void)paymentUsingSavedPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_PAY : TYPE_POST :data :success :failure];
}

-(void)paymentUsingNewPaymentCard:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_PAY : TYPE_POST :data :success :failure];
}

-(void)paymentUsingNetBanking:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_PAY : TYPE_POST :data :success :failure];
}

-(void)rechargePrepaidCardUsingNetBanking:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_RECHARGE : TYPE_POST :data :success :failure];
}

-(void)getTransactionHistory:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_TRANSACTION_HISTORY : TYPE_POST :data :success :failure];
}

-(void)getTransactionDetails:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_TRANSACTION_DETAILS : TYPE_POST :data :success :failure];
}

-(void)getPaymentByHash:(NSMutableDictionary*) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure
{
    NSString *temp = [ENDPOINT_PAYMENT stringByAppendingString:@"/:"];
    NSString *paymentHash = [data objectForKey:@"payment_hash"];
    NSString *url = [temp stringByAppendingString:paymentHash];

    
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:url :TYPE_GET :data :success :failure];
}

-(void) paymentFulfilledRequest: (NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : ENDPOINT_PAY : TYPE_POST :data :success :failure];
}

-(void) genericPostRequest: (NSString *) route :(NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : route : TYPE_POST :data :success :failure];
}

-(void) genericGetRequest: (NSString *) route :(NSMutableDictionary *) data :(void(^)(NSMutableDictionary *))success :(void(^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax : route : TYPE_GET :data :success :failure];
}

- (void) getPlaces:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_PLACES :TYPE_POST :data :success :failure];
    
}

- (void) reportIssue:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_PLACES :TYPE_POST :data :success :failure];
}

- (void) checkin:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_CHECKIN :TYPE_POST :data :success :failure];
}

- (void) checkout:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_CHECKOUT :TYPE_POST :data :success :failure];
}

- (void) feedback:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_FEEDBACK :TYPE_POST :data :success :failure];
}

- (void) requestBill:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_REQUESTBILL :TYPE_POST :data :success :failure];
}

- (void) pendingPayments:(NSMutableDictionary *)data :(void (^)(NSMutableDictionary *))success :(void (^)(NSError *))failure{
    AjaxHelper *ajaxHelper = [[AjaxHelper alloc] init];
    [ajaxHelper ajax:ENDPOINT_PENDING_PAYMENTS :TYPE_POST :data :success :failure];
}

@end

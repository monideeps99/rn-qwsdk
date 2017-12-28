//
//  Constants.m
//  QWCore_ios
//
//  Created by Monideep Purkayastha on 10/09/15.
//  Copyright (c) 2015 LivQuik. All rights reserved.
//

#import "Constants.h"

//POSSIBLE CONFIGURATIONS
NSString * const CONFIG_LIVE = @"live";
NSString * const CONFIG_UAT = @"uat";
NSString * const CONFIG_DEV = @"dev";
NSString * const CONFIG_STAGING = @"staging";
NSString * const CONFIG_TEST = @"test";

//RELEASE STRING
NSString * const SDK_VERSION = @"1.0.0";

//AJAX STUFF
NSString * const SERVER_URL_LIVE = @"server.livquik.com";
NSString * const SERVER_URL_UAT = @"uat.quikwallet.com";
NSString * const SERVER_URL_DEV = @"192.168.1.100";
NSString * const SERVER_URL_TEST = @"test.quikwallet.com";
NSString * const SERVER_URL_STAGING = @"staging.quikpay.in";
NSString * const SERVER_PORT_DEV = @"3014"; //Change this only (DO NOT COMMIT)
NSString * const ENDPOINT_PREFIX = @"api/public";
NSString * const ENDPOINT_ZAGGLE_PREFIX = @"api/zaggle/user";
NSString * const ENDPOINT_POS_PREFIX = @"api/pos";
NSString * const TYPE_POST = @"POST";
NSString * const TYPE_GET = @"GET";
NSString * const STATUS_SUCCESS = @"success";
NSString * const STATUS_FAILED = @"failed";

// ERRORS
NSString *const QWDomain = @"com.livquik.QWCore";
NSString *const QWErrorMessageKey = @"com.livquik.QWCore:ErrorMessageKey";

// AJAX ENDPOINTS

// CARDS APIs Endpoints
NSString * const ENDPOINT_CARDS = @"cards";
NSString * const ENDPOINT_ADDCARD = @"addcard";
NSString * const ENDPOINT_DELETE_CARD = @"deletecard";
NSString * const ENDPOINT_CHANGE_DEFAULT_CARD = @"changedefaultcard";

//  Payments API Endpoints
NSString * const ENDPOINT_GETREQUESTEDPAYMENT = @"getrequestedpayment";
NSString * const ENDPOINT_REJECTPAYMENTS = @"rejectpayment";
NSString * const ENDPOINT_CANCELPAYMENT = @"cancelpayment";
NSString * const ENDPOINT_DROPPAYMENT = @"droppayment";
NSString * const ENDPOINT_RECHARGE = @"recharge";
NSString * const ENDPOINT_HOWTOPAY = @"howtopay";
NSString * const ENDPOINT_HOWYOUPAID = @"howyoupaid";
NSString * const ENDPOINT_TRANSACTION_DETAILS = @"transactiondetails";
NSString * const ENDPOINT_TRANSACTION_HISTORY = @"transactionhistory";
NSString * const ENDPOINT_PAY = @"pay";
NSString * const ENDPOINT_PAYMENT = @"payment";
NSString * const ENDPOINT_REQUESTBILL = @"requestbill";
NSString * const ENDPOINT_PENDING_PAYMENTS = @"pendingpayments";

NSString * const ENDPOINT_REQUEST_PAYMENT = @"1/1/requestpayment?code=abcde";

// Places API Endpoints
NSString * const ENDPOINT_PLACES = @"places";
NSString * const ENDPOINT_REPORT_ISSUE = @"reportissue";
NSString * const ENDPOINT_CHECKIN = @"checkin";
NSString * const ENDPOINT_CHECKOUT = @"checkout";
NSString * const ENDPOINT_FEEDBACK = @"feedback";



@implementation Constants

@end

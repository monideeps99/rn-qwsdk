//
//  QRPayViewController.h
//  RNQWSdk
//
//  Created by Deep on 26/12/17.
//  Copyright © 2017 QuikWallet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QRPayViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate, UITextFieldDelegate>

@property (nonatomic) BOOL isReading;
@property (nonatomic) BOOL isCaptured;
@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@end

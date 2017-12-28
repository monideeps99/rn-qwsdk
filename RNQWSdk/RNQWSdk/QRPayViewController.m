//
//  QRPayViewController.m
//  RNQWSdk
//
//  Created by Deep on 26/12/17.
//  Copyright © 2017 QuikWallet. All rights reserved.
//

#import "QRPayViewController.h"
#import "QWSdk.h"
#import "QWActivityHelper.h"

@interface QRPayViewController ()

@end

@implementation QRPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"Scan QR Code";
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:(UIBarButtonSystemItemStop)
                                    target:self
                                    action:@selector(doneButtonTapped:)];
    
    self.navigationItem.rightBarButtonItem = closeButton;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self.isReading) {
            
            if ([self startReading]) {
            }
            
        }else{
            [self stopReading];
        }
        
        self.isReading = !self.isReading;
        _isCaptured = NO;
    });
}

- (BOOL)startReading {
    NSError *error;
    
    // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
    // as the media type parameter.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        // If any error occurs, simply log the description of it and don't continue any more.
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    // Initialize the captureSession object.
    _captureSession = [[AVCaptureSession alloc] init];
    // Set the input device on the capture session.
    [_captureSession addInput:input];
    
    
    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    // Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:self.view.layer.bounds];
    [self.view.layer addSublayer:_videoPreviewLayer];
    
    
    // Start video capture.
    [_captureSession startRunning];
    
    return YES;
}

-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
    _isReading = NO;
    
    // Remove the video preview layer from the viewPreview view's layer.
    [self.videoPreviewLayer removeFromSuperlayer];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    if (!_isCaptured) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [QWActivityHelper displayActivityIndicator:self.view];
        });
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if (metadataObjects != nil && [metadataObjects count] > 0) {
            // Get the metadata object.
            AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
            if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
                NSLog(@"QR CODE %@", [metadataObj stringValue]);
                _isCaptured = YES;
                
                [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
                [QWActivityHelper removeActivityIndicator:self.view];

                [self.data setObject:[metadataObj stringValue] forKey:@"terminalkey"];
                
                void(^success)() = ^void(id  data){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [QWActivityHelper removeActivityIndicator:self.view];
                        [self stopReading];
                        NSLog(@"SUCCESS %@", data);
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"QWSUCCESS" object:nil userInfo:data];
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                };
                
                void(^failure)() = ^void(NSError* error) {
                    NSLog(@"FAILURE %@", error);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [QWActivityHelper removeActivityIndicator:self.view];
                        [self stopReading];
                        NSDictionary *errorInfo = [error userInfo];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"QWFAILURE" object:nil userInfo:errorInfo];
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                };
                
                QWSdk *qw = [[QWSdk alloc] init];
                [qw requestBill:self.data :success :failure];
            }
        }
    }
}

- (IBAction)doneButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

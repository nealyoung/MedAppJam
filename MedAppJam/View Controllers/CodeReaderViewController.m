//
//  CodeReaderViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/12/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "CodeReaderViewController.h"

#import "UIFont+Application.h"

@interface CodeReaderViewController ()

- (void)cancel;

@end

@implementation CodeReaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        ZBarImageScanner *imageScanner = [[ZBarImageScanner alloc] init];
        [imageScanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
        self.readerView = [[ZBarReaderView alloc] initWithImageScanner:imageScanner];
        self.readerView.tracksSymbols = YES;
        self.readerView.frame = [UIScreen mainScreen].bounds;
        [self.readerView start];
        [self.view addSubview:self.readerView];
        
        // Create a toolbar with a cancel button
        CGRect toolbarFrame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 44, [[UIScreen mainScreen] bounds].size.width, 44);
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
        [toolbar setItems:@[cancelButton] animated:NO];
        [self.view addSubview:toolbar];
        
        UILabel *instructionLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0f, 20.0f, 240.0f, 40.0f)];
        instructionLabel.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
        instructionLabel.text = @"Scan a barcode";
        instructionLabel.textColor = [UIColor whiteColor];
        instructionLabel.font = [UIFont mediumApplicationFontOfSize:16.0f];
        instructionLabel.textAlignment = NSTextAlignmentCenter;
        
        // Round the corners of the label
        CALayer *thumbnailLayer = [instructionLabel layer];
        [thumbnailLayer setMasksToBounds:YES];
        [thumbnailLayer setCornerRadius:5.0f];
        [self.view addSubview:instructionLabel];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancel {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end

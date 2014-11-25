//
//  ViewController.m
//  RSImageView
//
//  Created by Ramaraj Thanga Pandi on 25/11/14.
//  Copyright (c) 2014 Ramaraj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [partialImage setImageURL:[NSURL URLWithString:@"https://docs.google.com/uc?export=download&id=0B6gRtssGeIGqTlRQT05QWFc5azg"]];
    [partialImage setProgressIndicator:progressMeter];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDownloading:(id)sender {
    [partialImage start];
}

@end

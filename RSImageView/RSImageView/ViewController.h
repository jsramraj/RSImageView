//
//  ViewController.h
//  RSImageView
//
//  Created by Ramaraj Thanga Pandi on 25/11/14.
//  Copyright (c) 2014 Ramaraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSImageView.h"

@interface ViewController : UIViewController{
    
    IBOutlet RSImageView *partialImage;
    IBOutlet UIProgressView *progressMeter;
}

- (IBAction)startDownloading:(id)sender;


@end


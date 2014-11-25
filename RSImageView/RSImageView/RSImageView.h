//
//  RSImageView.h
//  PartialImage
//
//  Created by Ramaraj Thanga Pandi on 25/11/14.
//  Copyright (c) 2014 NanoSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSImageView : UIImageView

@property(nonatomic,retain) NSURL *imageURL;
@property(nonatomic,retain) UIProgressView *progressIndicator;


- (void)start;
- (void)pause;


@end

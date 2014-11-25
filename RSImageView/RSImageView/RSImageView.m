//
//  RSImageView.m
//  PartialImage
//
//  Created by Ramaraj Thanga Pandi on 25/11/14.
//  Copyright (c) 2014 NanoSoft. All rights reserved.
//

#import "RSImageView.h"
#import <CoreGraphics/CoreGraphics.h>
#import <ImageIO/ImageIO.h>

@interface RSImageView ()
{
    NSMutableData *imageData;
    long long imageSize;
    CGImageSourceRef imageSource;
    NSURLConnection *imageConnection;
    
}

@end

@implementation RSImageView

- (void)start{
    NSAssert((_imageURL != nil), @"Image URL cannot be nil");
    if (!imageConnection) {
        imageConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:_imageURL
                                                                                        cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                                                    timeoutInterval:60] delegate:self];
    }
    [imageConnection start];
}

-(void)pause{
    [imageConnection cancel];
}

#pragma mark - NSURLConnection delegates

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
    NSLog(@"Download started");
    NSLog(@"%s", __PRETTY_FUNCTION__);
    imageData = [NSMutableData data];
    imageSize = [response expectedContentLength];
    imageSource = CGImageSourceCreateIncremental(NULL);
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    [imageData appendData:data];
    float progress = (float)imageData.length/(float)imageSize;
    
    if (_progressIndicator)
        [_progressIndicator setProgress:progress animated:YES];
    CGImageSourceUpdateData(imageSource, (__bridge CFDataRef)imageData, ([imageData length] == imageSize) ? true : false);
    CGImageRef cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    if (cgImage){
        UIImage* img = [[UIImage alloc] initWithCGImage:cgImage scale:1.0f orientation:UIImageOrientationUp];
        dispatch_async( dispatch_get_main_queue(), ^{
            self.image = img;
        });
        CGImageRelease(cgImage);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Download failed with error %@", [error localizedDescription]);
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
    NSLog(@"Download finished");
}


@end

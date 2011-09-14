//
//  AJSLoadingView.h
//  AJSKit
//
//  Created by Andy Smart on 14/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJSLoadingView : UIView
{
    UIActivityIndicatorView *_activityIndicator;
    UILabel *_textLabel;
    UIImageView *_imageView;
    
    UIView *_bezelView;
}

//Shows bezel in key window with activity indicator
//Can be passed to change the text of an existing loading view without re-animating

+ (void) showLoadingWithText:(NSString *)text;

//Shows (if not already showing) a bezel with centered image and optional text
//hides automatically after 1.5 seconds

+ (void) flashMessageWithImage:(UIImage *)image text:(NSString *)text;
+ (void) flashMessageWithImage:(UIImage *)image;

//Hides active loading view

+ (void) hide;

@end

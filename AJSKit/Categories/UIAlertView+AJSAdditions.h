//
//  UIAlert+AJSAdditions.h
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (AJSAdditions)

//Takes the domain of the error and displays a standard UIAlertView

+ (void) displayAlertFromError:(NSError *)error;

//Helper for quickly displaying a UIAlertView with an "OK" button

+ (void) displayAlertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end

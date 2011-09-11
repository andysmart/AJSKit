//
//  UIAlert+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "UIAlertView+AJSAdditions.h"

@implementation UIAlertView (AJSAdditions)

+ (void) displayAlertFromError:(NSError *)error
{
    NSString *errorMsg = [error domain];
    [self displayAlertWithTitle:NSLocalizedString(@"Error", @"")
                     andMessage:errorMsg];
}

+ (void) displayAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                          otherButtonTitles:nil];
    
    [alert show];
    [alert release];
}

@end

//
//  UIApplication+AJSAdditions.h
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (AJSAdditions)

//  Based on work by Matt Gemmell to find the keyboard subview of a window
//  Implementation uses iOS4+ methods / Class names
//  Major hat tip: http://cocoawithlove.com/2009/04/showing-message-over-iphone-keyboard.html

- (UIView *) keyboardView;

@end

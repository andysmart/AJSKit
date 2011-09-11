//
//  UIApplication+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "UIApplication+AJSAdditions.h"

@implementation UIApplication (AJSAdditions)

- (UIView *) keyboardView
{
    NSString *className = [NSString stringWithFormat:@"%@%@%@%@",
                           @"UI", @"Peripheral", @"Host", @"View"];
    
    Class keyboardClass = NSClassFromString(className);
    
    for (UIWindow *w in self.windows)
        for (UIView *v in w.subviews)
            if ([v isKindOfClass:keyboardClass])
                return v.superview;
    
    return nil;
}

@end

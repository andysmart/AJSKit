//
//  UIView+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "UIView+AJSAdditions.h"

@implementation UIView (AJSAdditions)

- (void) removeAllSubviews
{
    for (UIView *v in self.subviews)
        [v removeFromSuperview];
}

#pragma mark - Subview searching

- (BOOL) containsSubview:(UIView *)aView
{
    return [self containsSubview:aView searchSubviews:NO];
}

- (BOOL) containsSubview:(UIView *)aView searchSubviews:(BOOL)searchSubviews
{
    for (UIView *v in self.subviews) {
        
        if ([v isEqual:aView]) {
            return YES;
        } else if (searchSubviews) {
            for (UIView *v2 in v.subviews) {
                if ([v2 containsSubview:aView searchSubviews:searchSubviews]) {
                    return YES;
                }
            }
        }
    }
    
    return NO;
}

@end

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

@end

//
//  UIViewAdditionsTest.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "UIViewAdditionsTest.h"
#import "UIView+AJSAdditions.h"

@implementation UIViewAdditionsTest

- (void) removeAllSubviewsTest
{
    UIView *aView = [[[UIView alloc] init] autorelease];
    
    UIView *subview1 = [[[UIView alloc] init] autorelease];
    UIView *subview2 = [[[UIView alloc] init] autorelease];
    
    [aView addSubview:subview1];
    [aView addSubview:subview2];
    
    [aView removeAllSubviews];
    
    STAssertTrue([aView.subviews count] == 0, @"Subviews not removed");
}

@end

//
//  NSObject+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 10/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "NSObject+AJSAdditions.h"

@implementation NSObject (AJSAdditions)

- (void) performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_current_queue(), block);
}

@end

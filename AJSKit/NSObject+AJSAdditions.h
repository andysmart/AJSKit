//
//  NSObject+AJSAdditions.h
//  AJSKit
//
//  Created by Andy Smart on 10/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AJSAdditions)

//Helper to perform a block after an interval, GCD based

- (void) performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

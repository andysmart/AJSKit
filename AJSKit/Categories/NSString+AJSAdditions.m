//
//  NSString+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "NSString+AJSAdditions.h"

@implementation NSString (AJSAdditions)

#pragma mark - Component seperation

- (NSArray *)words
{
    return [self componentsSeparatedByString:@" "];
}

- (NSArray *)componentsFromCommaSeparatedList
{
    //Replace ", " to "," in order to standardise results
    
    self = [self stringByReplacingOccurrencesOfString:@", " withString:@","];
    return [self componentsSeparatedByString:@","];
}

@end

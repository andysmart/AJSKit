//
//  NSString+AJSAdditions.h
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AJSAdditions)

//Returns components seperated by " "

- (NSArray *)words;

//Standardises and splits comma seperated lists into components

- (NSArray *)componentsFromCommaSeparatedList;


@end

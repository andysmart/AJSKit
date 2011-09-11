//
//  NSStringAdditionsTest.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "NSStringAdditionsTest.h"
#import "NSString+AJSAdditions.h"

@implementation NSStringAdditionsTest

- (void) testWords
{
    NSString *sourceString = @"All UR Wordz Belong To Us";
    NSArray *words = [sourceString words];
    
    STAssertTrue([words count] == 6, @"Incorrect number of words in parsed array");
}

- (void) testCommaSeparation
{
    NSString *sourceString = @"a, list,of, words";
    NSArray *list = [sourceString componentsFromCommaSeparatedList];

    STAssertTrue([list count] == 4, @"Incorrect number of items in list");
    
    STAssertEqualObjects([list objectAtIndex:0], @"a", @"Incorrect parsing of object");
    STAssertEqualObjects([list objectAtIndex:1], @"list", @"Incorrect parsing of object");
    STAssertEqualObjects([list objectAtIndex:2], @"of", @"Incorrect parsing of object");
    STAssertEqualObjects([list objectAtIndex:3], @"words", @"Incorrect parsing of object");
}

@end

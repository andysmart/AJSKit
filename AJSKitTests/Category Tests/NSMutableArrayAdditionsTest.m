//
//  NSMutableArrayAdditionsTest.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "NSMutableArrayAdditionsTest.h"
#import "NSMutableArray+AJSAdditions.h"

@implementation NSMutableArrayAdditionsTest

- (void) testMoveObject
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:
                             @"One", @"Two", @"Three", @"Four", nil];
    
    [array moveObjectAtIndex:0 toIndex:1];
    
    STAssertEqualObjects([array objectAtIndex:1], @"One", @"Incorrect object at index #1");
    
    NSMutableArray *copyArr = [NSMutableArray arrayWithObjects:
                               @"Two", @"One", @"Three", @"Four", nil];
    
    STAssertEqualObjects(array, copyArr, @"Array not modified correctly");
}

- (void) testRemoveClassObjects
{
    NSNumber *num1 = [NSNumber numberWithInt:1];
    NSNumber *num2 = [NSNumber numberWithInt:43];
    
    NSString *str1 = @"TestStr1";
    NSString *str2 = @"TestStr2";
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:num1, str1, num2, str2, nil];
    
    [arr removeObjectsOfType:[NSNumber class]];
    
    NSMutableArray *expectedArr = [NSMutableArray arrayWithObjects:str1, str2, nil];
    
    STAssertEqualObjects(arr, expectedArr, @"Objects not correctly removed");
}

@end

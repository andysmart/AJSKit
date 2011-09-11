//
//  NSMutableArray+AJSAdditions.m
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "NSMutableArray+AJSAdditions.h"

@implementation NSMutableArray (AJSAdditions)

- (void) moveObjectAtIndex:(NSInteger)oldIndex 
                   toIndex:(NSInteger)newIndex
{
    if (newIndex != oldIndex) {
        
        id obj = [self objectAtIndex:oldIndex];
        [obj retain];
        
        [self removeObjectAtIndex:oldIndex];
        
        if (newIndex >= [self count]) {
#ifdef DEBUG
            NSLog(@"[NSMutableArray AJSAdditions] Can't add object at index: %d, appending to end of array", newIndex);
#endif
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:newIndex];
        }
        
        [obj release];
    }
}

- (void) removeObjectsOfType:(Class)type
{
    NSMutableArray *removeObjects = [NSMutableArray array];
    
    for (id anObject in self)
        if ([anObject isKindOfClass:type])
            [removeObjects addObject:anObject];
    
    [self removeObjectsInArray:removeObjects];
}

@end

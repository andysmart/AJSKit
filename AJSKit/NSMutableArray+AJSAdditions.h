//
//  NSMutableArray+AJSAdditions.h
//  AJSKit
//
//  Created by Andy Smart on 11/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (AJSAdditions)

- (void) moveObjectAtIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex;
- (void) removeObjectsOfType:(Class)type;

@end

//
//  LTThreadSafeArray.h
//  LTSupportAutomotive
//
//  Created by admin on 2020/1/22.
//  Copyright © 2020 Dr. Lauer Information Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTThreadSafeArray : NSObject
-(nullable id)firstObject;
-(nullable id)lastObject;
-(NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjectsInRange:(NSRange)range;
- (void)addObject:(id)anObject;
- (void)removeObject:(nonnull id)object;
- (void)removeLastObject;
- (void)removeAllObjects;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end

NS_ASSUME_NONNULL_END

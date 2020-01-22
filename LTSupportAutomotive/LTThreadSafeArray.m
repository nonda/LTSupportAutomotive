//
//  LTThreadSafeArray.m
//  LTSupportAutomotive
//
//  Created by admin on 2020/1/22.
//  Copyright © 2020 Dr. Lauer Information Technology. All rights reserved.
//

#import "LTThreadSafeArray.h"
@interface LTThreadSafeArray()
@property (nonatomic, strong) NSMutableArray *array;
@end
@implementation LTThreadSafeArray
-(instancetype)init{
	if (self = [super init]) {
		_array = [NSMutableArray array];
	}
	return self;
}

-(nullable id)firstObject {
	__block id result;
	dispatch_sync(self.syncQueue, ^{
		result = _array.firstObject;
	});
	return result;
}

-(nullable id)lastObject {
	__block id result;
	dispatch_sync(self.syncQueue, ^{
		result = _array.lastObject;
	});
	return result;
}

-(NSUInteger)count {
	__block NSUInteger result;
	dispatch_sync(self.syncQueue, ^{
		result = _array.count;
	});
	return result;
}

- (id)objectAtIndex:(NSUInteger)index {
    
    __block id result;
    dispatch_sync(self.syncQueue, ^{
		result = [_array objectAtIndex:index];
    });
    
    return result;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    dispatch_barrier_async(self.syncQueue, ^{
		[self->_array insertObject:anObject atIndex:index];
    });
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    dispatch_barrier_async(self.syncQueue, ^{
		[self->_array removeObjectAtIndex:index];
    });
}

- (void)removeObjectsInRange:(NSRange)range
{
    
    dispatch_barrier_async(self.syncQueue, ^{
		[self->_array removeObjectsInRange:range];
    });
}


- (void)addObject:(id)anObject
{
    dispatch_barrier_async(self.syncQueue, ^{
		[self->_array addObject:anObject];
    });
}

- (void)removeObject:(nonnull id)object {
    dispatch_barrier_async(self.syncQueue, ^{
        [self->_array removeObject:object];
    });
}

- (void)removeLastObject {
    dispatch_barrier_async(self.syncQueue, ^{
        [self->_array removeLastObject];
    });
}

- (void)removeAllObjects {
    dispatch_barrier_async(self.syncQueue, ^{
        [self->_array removeAllObjects];
    });
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    
    
    dispatch_barrier_async(self.syncQueue, ^{
		[self->_array replaceObjectAtIndex:index withObject:anObject];
    });
}

#pragma mark - Private
- (dispatch_queue_t)syncQueue {
	static dispatch_queue_t queue = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		queue = dispatch_queue_create("com.kong.LTThreadSafeArray", DISPATCH_QUEUE_CONCURRENT);
	});
	return queue;
}
@end

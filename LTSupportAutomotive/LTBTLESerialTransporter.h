//
//  Copyright (c) Dr. Michael Lauer Information Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreBluetooth/CoreBluetooth.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString* const LTBTLESerialTransporterDidUpdateSignalStrength;

typedef void(^LTBTLESerialTransporterConnectionBlock)(NSInputStream * _Nullable inputStream,
													  NSOutputStream * _Nullable outputStream,
													  NSString * _Nullable serviceUUID,
													  NSString * _Nullable identifier,
													  NSString * _Nullable name);

@interface LTBTLESerialTransporter : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>

@property(strong,nonatomic,readonly) NSNumber* signalStrength;

+ (instancetype)transporterWithIdentifier:(nullable NSUUID *)identifier serviceUUIDs:(NSArray<CBUUID *> *)serviceUUIDs;
- (void)connectWithBlock:(LTBTLESerialTransporterConnectionBlock)block;
- (void)disconnect;

- (void)startUpdatingSignalStrengthWithInterval:(NSTimeInterval)interval;
- (void)stopUpdatingSignalStrength;

@end

NS_ASSUME_NONNULL_END


//
//  ShipmentTrackInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShipmentTrackInfo : NSObject
@property NSString *shipmentId;
@property NSString *shipmentStatus;

-(instancetype) initWithInfo:(NSString *)shipmentId andShipmentStatus:(NSString *)shipmentStatus;

@end

NS_ASSUME_NONNULL_END

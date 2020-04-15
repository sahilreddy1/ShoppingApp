//
//  ShipmentTrackInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ShipmentTrackInfo.h"

@implementation ShipmentTrackInfo
- (instancetype)initWithInfo:(NSString *)shipmentId andShipmentStatus:(NSString *)shipmentStatus {
    
    self = [super init];
    if(self) {
        self.shipmentId = shipmentId;
        self.shipmentStatus = shipmentStatus;
    }
    return self;
}
@end

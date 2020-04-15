//
//  OrderInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "OrderInfo.h"

@implementation OrderInfo

- (instancetype)initWithInfo:(NSString *)oId andOrderName:(NSString *)oName andOrderBillingadd:(NSString *)oBillingadd andOrderDeliveryadd:(NSString *)oDeliveryadd andOrderMobile:(NSString *)oMobile andOrderItemname:(NSString *)oItemname andOrderTotalprice:(NSString *)oTotalprice andPaidprice:(NSString *)oPaidprice andOrderPlacedone:(NSString *)oPlacedon{
    
    self = [super init];
    if (self){
        self.oId = oId;
        self.oName = oName;
        self.oBillingadd = oBillingadd;
        self.oDeliveryadd = oDeliveryadd;
        self.oMobile = oMobile;
        self.oItemname = oItemname;
        self.oTotalprice = oTotalprice;
        self.oPaidprice = oPaidprice;
        self.oPlacedon = oPlacedon;
    }
    
    return self;
}
@end

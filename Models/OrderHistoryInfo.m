//
//  OrderHistoryInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "OrderHistoryInfo.h"

@implementation OrderHistoryInfo

- (instancetype)initWithInfo:(NSString *)oId andOrderStatus:(NSString *)oStatus andOrderName:(NSString *)oName andOrderBillingadd:(NSString *)oBillingadd andDeliveryAdd:(NSString *) oDeliveryadd andOrderMobile:(NSString *)oMobile andOrderEmail:(NSString *)oEmail andOrderItemId:(NSString *)oItemId andOrderItemname:(NSString *)oItemname andOrderItemquantity:(NSString *)oItemquantity andOrderTotalprice:(NSString *)oTotalprice andPaidprice:(NSString *)oPaidprice andOrderPlacedone:(NSString *)oPlacedon{
    
    self = [super init];
    if(self){
        self.oId = oId;
        self.oStatus = oStatus;
        self.oName = oName;
        self.oBillingadd = oBillingadd;
        self.oDeliveryadd = oDeliveryadd;
        self.oMobile = oMobile;
        self.oEmail = oEmail;
        self.oitemId = oItemId;
        self.oItemname = oItemname;
        self.oItemQuantity = oItemquantity;
        self.oTotalprice = oTotalprice;
        self.oPaidprice = oPaidprice;
        self.oPlacedon = oPlacedon;
    }
    return self;
}
@end

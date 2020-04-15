//
//  OrderHistoryInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderHistoryInfo : NSObject

@property NSString* oId;
@property NSString* oStatus;
@property NSString* oName;
@property NSString* oBillingadd;
@property NSString* oDeliveryadd;
@property NSString* oMobile;
@property NSString* oEmail;
@property NSString* oitemId;
@property NSString* oItemname;
@property NSString* oItemQuantity;
@property NSString* oTotalprice;
@property NSString* oPaidprice;
@property NSString* oPlacedon;

- (instancetype)initWithInfo:(NSString *)oId andOrderStatus:(NSString *)oStatus andOrderName:(NSString *)oName andOrderBillingadd:(NSString *)oBillingadd andDeliveryAdd:(NSString *) oDeliveryadd andOrderMobile:(NSString *)oMobile andOrderEmail:(NSString *)oEmail andOrderItemId:(NSString *)oItemId andOrderItemname:(NSString *)oItemname andOrderItemquantity:(NSString *)oItemquantity andOrderTotalprice:(NSString *)oTotalprice andPaidprice:(NSString *)oPaidprice andOrderPlacedone:(NSString *)oPlacedon;

@end

NS_ASSUME_NONNULL_END

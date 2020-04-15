//
//  OrderInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderInfo : NSObject
@property NSString* oId;
@property NSString* oName;
@property NSString* oBillingadd;
@property NSString* oDeliveryadd;
@property NSString* oMobile;
@property NSString* oItemname;
@property NSString* oTotalprice;
@property NSString* oPaidprice;
@property NSString* oPlacedon;


- (instancetype)initWithInfo:(NSString *)oId andOrderName:(NSString *)oName andOrderBillingadd:(NSString *)oBillingadd andOrderDeliveryadd:(NSString *)oDeliveryadd andOrderMobile:(NSString *)oMobile andOrderItemname:(NSString *)oItemname andOrderTotalprice:(NSString *)oTotalprice andPaidprice:(NSString *)oPaidprice andOrderPlacedone:(NSString *)oPlacedon;
@end

NS_ASSUME_NONNULL_END

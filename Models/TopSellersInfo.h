//
//  TopSellersInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/8/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopSellersInfo : NSObject

@property NSString* pId;
@property NSString* sellerName;
@property NSString* sellerDeal;
@property NSString* sellerRating;
@property NSString* sellerLogo;

- (instancetype)initWithInfo:(NSString *)pId andSellerName:(NSString *)sellerName andSellerDeal:(NSString *)sellerDeal andSellerRating:(NSString *)sellerRating andSellerLogo:(NSString *)sellerLogo;


@end

NS_ASSUME_NONNULL_END

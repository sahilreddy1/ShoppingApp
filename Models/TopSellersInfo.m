//
//  TopSellersInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/8/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "TopSellersInfo.h"

@implementation TopSellersInfo

- (instancetype)initWithInfo:(NSString *)pId andSellerName:(NSString *)sellerName andSellerDeal:(NSString *)sellerDeal andSellerRating:(NSString *)sellerRating andSellerLogo:(NSString *)sellerLogo {
    self = [super init];
    if (self) {
        self.pId = pId;
        self.sellerName = sellerName;
        self.sellerDeal = sellerDeal;
        self.sellerRating = sellerRating;
        self.sellerLogo = sellerLogo;
    }
    return self;
}

@end

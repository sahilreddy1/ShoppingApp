//
//  ProductInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ProductInfo.h"

@implementation ProductInfo

- (instancetype)initWithInfo:(NSString *)pId andProductName:(NSString *)pName andProductQuantity:(NSString *)pQuantity andProductPrice:(NSString *)pPrice andProductDescription:(NSString *)pDiscription andProductImageUrl:(NSString *)pImageUrl{
    
    self = [super init];
    if (self){
        self.pId = pId;
        self.pName = pName;
        self.pQuantity = pQuantity;
        self.pPrice = pPrice;
        self.pDiscription = pDiscription;
        self.pImageUrl = pImageUrl;
    }
    return self;
}

@end

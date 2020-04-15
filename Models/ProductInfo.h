//
//  ProductInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductInfo : NSObject

@property NSString* pId;
@property NSString* pName;
@property NSString* pQuantity;
@property NSString* pPrice;
@property NSString* pDiscription;
@property NSString* pImageUrl;


- (instancetype)initWithInfo:(NSString *)pId andProductName:(NSString *)pName andProductQuantity:(NSString *)pQuantity andProductPrice:(NSString *)pPrice andProductDescription:(NSString *)pDiscription andProductImageUrl:(NSString *)pImageUrl;

@end

NS_ASSUME_NONNULL_END

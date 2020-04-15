//
//  APIParser.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "CategoryInfo.h"
#import "SubCategoryInfo.h"
#import "ProductInfo.h"
#import "OrderInfo.h"
#import "ShipmentTrackInfo.h"
#import "OrderHistoryInfo.h"
#import "TopSellersInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface APIParser : NSObject
+(instancetype)sharedInstance;

- (UserInfo *)signInParser:(NSData *)userDetail andError:(NSError *)error withCompletion:(void (^)(bool hasError, NSString *errorMsg))block;
-(void)prodCategoryParser:(NSData *)categoryInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<CategoryInfo *> *result))block;
- (void)subCategoryParser:(NSData *)subCategoryInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<SubCategoryInfo *> *result))completionHandler;
- (void)productParser:(NSData *)productInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<ProductInfo *> *result))block;
- (void)orderParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, OrderInfo * result))block;
- (void)trackerParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, ShipmentTrackInfo * result))block;
- (void)orderHistoryParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<OrderHistoryInfo *> * result))block;
- (void)topSellerParser:(NSData *)topSellerInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<TopSellersInfo *> *result))block;

@end

NS_ASSUME_NONNULL_END

//
//  APIParser.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "APIParser.h"

@implementation APIParser
+ (instancetype)sharedInstance
{
    
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (UserInfo *)signInParser:(NSData *)userDetail andError:(NSError *)error withCompletion:(void (^)(bool hasError, NSString *errorMsg))block {
    UserInfo *userInfo = nil;
    
    id userInfoJson = [NSJSONSerialization JSONObjectWithData: userDetail options:NSJSONReadingMutableContainers error: &error];

    if (error) {
        block(true, PASSWORDERROR);
    }
    else if (!userInfoJson) {
        block(true, kNoDataError);
    }
    else if ([userInfoJson isKindOfClass:[NSDictionary class]])
    {
        NSString *resp = userInfoJson[@"msg"][0];
        if ([resp isEqual:@"Mobile number not register"]) {
            block(true, MOBILENOTSIGNEDUP);
        } else {
            block(true, PASSWORDERROR);
        }
    }
    else if ([userInfoJson isKindOfClass:[NSArray class]] && ![userInfoJson[0][@"msg"] isEqual: @"success"])
    {
        block(true, PASSWORDERROR);
    }
    else
    {
        NSLog(@"%@", userInfoJson[0][@"id"]);
        
        userInfo = [[UserInfo alloc] initWithInfo:userInfoJson[0][@"id"] andFirstName:userInfoJson[0][@"firstname"] andLastName:userInfoJson[0][@"lastname"] andEmail:userInfoJson[0][@"email"] andMobile:userInfoJson[0][@"mobile"] andAppApiKey:userInfoJson[0][@"appapikey "]];
        
        [[NSUserDefaults standardUserDefaults] setValue:userInfoJson[0][@"id"] forKey:@"userId"];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isLoggedIn"];
        [[NSUserDefaults standardUserDefaults] setValue:userInfoJson[0][@"appapikey "] forKey:@"appapikey"];
        [[NSUserDefaults standardUserDefaults] setValue:userInfoJson[0][@"mobile"] forKey:@"mobile"];
        NSLog(@"Mobile: ** %@",userInfoJson[0][@"mobile"]);
        block(false, SUCCESS);
    }
    
    return userInfo;
}

- (void)prodCategoryParser:(NSData *)categoryInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<CategoryInfo *> *result))block;{
    
    NSMutableArray<CategoryInfo *> *arr = [[NSMutableArray alloc] init];
    
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:categoryInfoList options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        NSLog(@"Error Parsing. error: %@", error);
        block(true, arr);
    } else{
        NSArray *categories = jsonData[@"category"];
        for(int i = 0; i < categories.count; i++) {
            NSDictionary *category = categories[i];
            CategoryInfo *categoryItem = [[CategoryInfo alloc] initWithInfo:category[@"cid"] andCategoryName:category[@"cname"] andCategoryDescription:category[@"cdiscription"] andCategoryImageUrl:category[@"cimagerl"]];
            [arr addObject:categoryItem];
        }
        block(false, arr);
    }
    
}

- (void)subCategoryParser:(NSData *)subCategoryInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<SubCategoryInfo *> *result))completionHandler {
    NSMutableArray<SubCategoryInfo *> *arr = [[NSMutableArray alloc] init];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:subCategoryInfoList options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        completionHandler(true, arr);
    } else {
        NSArray *sCategories = jsonData[@"subcategory"];
        for(int i = 0; i < sCategories.count; i++) {
            NSDictionary *sCategory = sCategories[i];
            SubCategoryInfo *sCategoryItem = [[SubCategoryInfo alloc] initWithSCid:sCategory[@"scid"] andSCategoryName:sCategory[@"scname"] andSCategoryDescription:sCategory[@"scdiscription"] andSCategoryImageUrl:sCategory[@"scimageurl"]];
            [arr addObject:sCategoryItem];
        }
        completionHandler(false, arr);
    }
}

- (void)productParser:(NSData *)productInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<ProductInfo *> *result))block;{
    
    NSMutableArray<ProductInfo *> *arr = [[NSMutableArray alloc] init];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:productInfoList options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        block(true, arr);
    } else {
        NSArray *products = jsonData[@"products"];
        NSLog(@"check api parse nsarray %@",products);
        for (int i = 0; i < products.count; i++) {
            NSDictionary *product = products[i];
            ProductInfo *productItem = [[ProductInfo alloc] initWithInfo:product[@"id"] andProductName:product[@"pname"] andProductQuantity:product[@"quantity"] andProductPrice:product[@"prize"] andProductDescription:product[@"discription"] andProductImageUrl:product[@"image"]];
            [arr addObject:productItem];
        }
        block(false, arr);
    }
}

- (void)orderParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, OrderInfo *result))block;{
    
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:orderInfo options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        block(true, nil);
    } else {
        NSArray *orderArr = jsonData[@"Order confirmed"];
        NSLog(@"check api parse nsarray %@",orderArr);
        NSDictionary *order = orderArr[0];
        OrderInfo *orderItem = [[OrderInfo alloc] initWithInfo:order[@"orderid"] andOrderName:order[@"name"] andOrderBillingadd:order[@"billingadd"] andOrderDeliveryadd:order[@"deliveryadd"] andOrderMobile:order[@"mobile"] andOrderItemname:order[@"itemname"] andOrderTotalprice:order[@"totalprice"] andPaidprice:order[@"paidprice"] andOrderPlacedone:order[@"placedon"]];
        block(false, orderItem);
    }
}

- (void)trackerParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean * _Nonnull, ShipmentTrackInfo * _Nonnull))block {
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:orderInfo options:NSJSONReadingMutableContainers error:&error];
    
    if(!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        block(true, nil);
    }else {
        NSArray *trackerArr = jsonData[@"Shipment track"];
        NSLog(@"check api parse nsarray %@",trackerArr);
        NSDictionary *tracker = trackerArr[0];
        ShipmentTrackInfo *trackerItem = [[ShipmentTrackInfo alloc] initWithInfo:tracker[@"shipmentid"] andShipmentStatus:tracker[@"shipmentstatus"]];
        block(false,trackerItem);
    }
    
}

- (void)orderHistoryParser:(NSData *)orderInfo andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<OrderHistoryInfo *> *result))block {
    
    NSMutableArray<OrderHistoryInfo *> *arr = [[NSMutableArray alloc] init];
    
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:orderInfo options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        block(true, nil);
    } else {
        NSArray *orderArr = jsonData[@"Order history"];
//        NSLog(@"check api parse nsarray %@",orderArr);
        for(int i = 0; i < orderArr.count; i++){
         NSDictionary *order = orderArr[i];
            OrderHistoryInfo *oHistoryItem = [[OrderHistoryInfo alloc] initWithInfo:order[@"orderid"] andOrderStatus:order[@"orderstatus"] andOrderName:order[@"name"] andOrderBillingadd:order[@"billingadd"] andDeliveryAdd:order[@"deliveryadd"] andOrderMobile:order[@"mobile"] andOrderEmail:order[@"email"] andOrderItemId:order[@"itemid"] andOrderItemname:order[@"itemname"] andOrderItemquantity:order[@"itemquantity"] andOrderTotalprice:order[@"totalprice"] andPaidprice:order[@"paidprice"] andOrderPlacedone:order[@"placedon"]];
                                              
            [arr addObject:oHistoryItem];
        }
        block(false, arr);
    }
}

- (void)topSellerParser:(NSData *)topSellerInfoList andError:(NSError *)error withCompletion:(void (^)(Boolean *hasError, NSMutableArray<TopSellersInfo *> *result))block {
    NSMutableArray<TopSellersInfo *> *arr = [[NSMutableArray alloc] init];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:topSellerInfoList options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonData || error) {
        NSLog(@"Error parsing JSON: %@", error);
        block(true, arr);
    } else {
        NSArray *topSellers = jsonData[@"Top sellers"];
        for (int i = 0; i < topSellers.count; i++) {
            NSDictionary *topSeller = topSellers[i];
            TopSellersInfo *topSellerItem = [[TopSellersInfo alloc] initWithInfo:topSeller[@"id"] andSellerName:topSeller[@"sellername"] andSellerDeal:topSeller[@"sellerdeal"] andSellerRating:topSeller[@"sellerrating"] andSellerLogo:topSeller[@"sellerlogo"]];
            [arr addObject:topSellerItem];
        }
        block(false, arr);
    }
}

@end

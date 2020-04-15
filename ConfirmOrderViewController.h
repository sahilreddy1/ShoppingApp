//
//  ConfirmOrderViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIHandler.h"
#import "OrderInfo.h"
#import "ProductInfo.h"
#import "APIParser.h"
NS_ASSUME_NONNULL_BEGIN

@interface ConfirmOrderViewController : UIViewController
@property ProductInfo *product;
@end

NS_ASSUME_NONNULL_END

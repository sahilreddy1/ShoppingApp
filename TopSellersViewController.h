//
//  TopSellersViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/8/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopSellersInfo.h"
#import "APIParser.h"
#import "APIHandler.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopSellersViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property NSMutableArray<TopSellersInfo *> *topSellers;
@property NSMutableArray<UIImage *> *topSellerImgs;
@end

NS_ASSUME_NONNULL_END

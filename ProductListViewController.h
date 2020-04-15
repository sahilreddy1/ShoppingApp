//
//  ProductListViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIHandler.h"
#import "APIParser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductListViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property NSString *cid;
@property NSString *scid;
@property NSMutableArray<ProductInfo*> *productsArray;
@property NSMutableArray<UIImage *> *productImgsArray;

@end

NS_ASSUME_NONNULL_END

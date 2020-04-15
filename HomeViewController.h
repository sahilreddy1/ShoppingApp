//
//  HomeViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property NSMutableArray<CategoryInfo *> *categories;
@property NSMutableArray<UIImage *> *categoryImgs;


@end

NS_ASSUME_NONNULL_END

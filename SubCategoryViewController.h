//
//  SubCategoryViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubCategoryInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface SubCategoryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property NSString *cId;
@property NSMutableArray<SubCategoryInfo *> *subCatArray;
@property NSMutableArray<UIImage *> *subCatImgArray;

@end

NS_ASSUME_NONNULL_END

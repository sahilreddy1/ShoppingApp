//
//  SubCategoryCollectionViewCell.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIHandler.h"
#import "APIParser.h"
#import "SubCategoryCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubCategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *subCategoryImage;
@property (weak, nonatomic) IBOutlet UILabel *scImageDesciption;


@end

NS_ASSUME_NONNULL_END

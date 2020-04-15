//
//  TopSellersCollectionViewCell.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/8/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopSellersCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@end

NS_ASSUME_NONNULL_END

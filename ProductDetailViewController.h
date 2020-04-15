//
//  ProductDetailViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/4/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailViewController : UIViewController
@property ProductInfo *product;
@property UIImage *productImg;

@property (weak, nonatomic) IBOutlet UIImageView *productImgView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

NS_ASSUME_NONNULL_END

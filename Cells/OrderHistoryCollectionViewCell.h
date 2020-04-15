//
//  OrderHistoryCollectionViewCell.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderHistoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *oidLbl;
@property (weak, nonatomic) IBOutlet UILabel *oStatusLbl;
@property (weak, nonatomic) IBOutlet UILabel *shippingAddrLbl;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *oPlacedLbl;

@end

NS_ASSUME_NONNULL_END

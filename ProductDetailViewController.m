//
//  ProductDetailViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/4/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "APIHandler.h"
#import "ConfirmOrderViewController.h"

@interface ProductDetailViewController ()
@property NSString *userId;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpDetailView];
}
- (void)setUpDetailView
{
    _priceLabel.text = _product.pPrice;
    _descriptionLabel.text = _product.pDiscription;
    _productImgView.image = _productImg;
    _productName.text = _product.pName;
}

- (IBAction)OrderBtnClicked:(UIButton *)sender {
    
    ConfirmOrderViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ConfirmOrderViewController"];
    ctrl.product = [[ProductInfo alloc] initWithInfo:_product.pId andProductName:_product.pName andProductQuantity:_product.pQuantity andProductPrice:_product.pPrice andProductDescription:_product.pDiscription andProductImageUrl:_product.pImageUrl];
    [[self navigationController] pushViewController:ctrl animated:true];
}


@end

//
//  ProductListViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductInfo.h"
#import "ProductCollectionViewCell.h"
#import "ProductDetailViewController.h"

@interface ProductListViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collView;

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.productsArray = [[NSMutableArray alloc] init];
    self.productImgsArray = [[NSMutableArray alloc] init];
    
    [self fetchProductInfo];
}

- (void)fetchProductInfo {
    NSString *userId = [[NSUserDefaults standardUserDefaults] valueForKey: @"userId"];
    NSString *userapikey = [[NSUserDefaults standardUserDefaults] valueForKey: @"appapikey"];

    dispatch_group_t groupC = dispatch_group_create();
    dispatch_group_enter(groupC);
    dispatch_group_t imgGroupC = dispatch_group_create();
    [[APIHandler sharedInstance] productApiCall: userapikey andUserId:userId andCategoryId:_cid andSubCategoryId:_scid withCompletion:^(NSData *result, NSError *error) {
        [[APIParser sharedInstance] productParser:result andError:error withCompletion:^(Boolean *hasError, NSMutableArray<ProductInfo *> *result) {
            if (hasError) {
                NSLog(@"error");
            } else {
                self.productsArray = result;
                
                for (int i = 0; i < result.count; i++) {
                    dispatch_group_enter(imgGroupC);
                    [[APIHandler sharedInstance] downloadImg:result[i].pImageUrl withCompletion:^(UIImage *img) {
                        if (img != nil){
                        [self.productImgsArray addObject:img];
                        } else {
                            [self.productImgsArray addObject:[UIImage imageNamed:@"Image-2"]];
                        }
                        dispatch_group_leave(imgGroupC);
                    }];
                }
            }
            dispatch_group_notify(imgGroupC, dispatch_get_main_queue(), ^{
                dispatch_group_leave(groupC);
            });
            dispatch_group_notify(groupC, dispatch_get_main_queue(), ^{
                [self.collView reloadData];

            });
        }];
        
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    cell.productImage.image = _productImgsArray[indexPath.row];
    cell.productLabel.text = _productsArray[indexPath.row].pName;
    cell.productPrice.text = [@"$" stringByAppendingString:_productsArray[indexPath.row].pPrice];
    cell.productDescription.text = _productsArray[indexPath.row].pDiscription;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _productsArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductDetailViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    ctrl.product = [[ProductInfo alloc] initWithInfo:_productsArray[indexPath.row].pId andProductName:_productsArray[indexPath.row].pName andProductQuantity:_productsArray[indexPath.row].pQuantity andProductPrice:_productsArray[indexPath.row].pPrice andProductDescription:_productsArray[indexPath.row].pDiscription andProductImageUrl:_productsArray[indexPath.row].pImageUrl];
    ctrl.productImg = _productImgsArray[indexPath.row];
    [[self navigationController] pushViewController:ctrl animated:true];
    
}

@end

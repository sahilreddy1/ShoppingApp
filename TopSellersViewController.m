//
//  TopSellersViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/8/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "TopSellersViewController.h"
#import "TopSellersCollectionViewCell.h"

@interface TopSellersViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collView;

@end

@implementation TopSellersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topSellers = [[NSMutableArray alloc] init];
    self.topSellerImgs = [[NSMutableArray alloc] init];
    [self fetchTopSellers];
}


- (void)fetchTopSellers {
    dispatch_group_t groupT = dispatch_group_create();
    dispatch_group_enter(groupT);
    dispatch_group_t imgGroupT = dispatch_group_create();
    [[APIHandler sharedInstance] topSellersApiCall:^(NSData *result, NSError *error) {
        [[APIParser sharedInstance] topSellerParser:result andError:error withCompletion:^(Boolean *hasError, NSMutableArray<TopSellersInfo *> *result) {
            if (hasError) {
                NSLog(@"Category Info is missing");
            } else{
                self.topSellers = result;
                for (int i = 0; i < result.count; i++) {
                    dispatch_group_enter(imgGroupT);
                    NSLog(@"Seller Logo: %@", result[i].sellerLogo);
                    [[APIHandler sharedInstance] downloadImg:result[i].sellerLogo withCompletion:^(UIImage *img) {
                        [[self topSellerImgs] addObject:img];
                        dispatch_group_leave(imgGroupT);
                    }];
                }
            }
            dispatch_group_notify(imgGroupT, dispatch_get_main_queue(), ^{
                dispatch_group_leave(groupT);
            });
            dispatch_group_notify(groupT, dispatch_get_main_queue(), ^{
                [self.collView reloadData];
                
            });
        }];
        
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TopSellersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLbl.text = self.topSellers[indexPath.row].sellerName;
    cell.img.image = self.topSellerImgs[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self topSellers].count;
}

@end

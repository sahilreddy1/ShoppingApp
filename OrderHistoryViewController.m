//
//  OrderHistoryViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "OrderHistoryViewController.h"
#import "OrderHistoryCollectionViewCell.h"
#import "APIHandler.h"
#import "APIParser.h"

@interface OrderHistoryViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collView;
@property NSMutableArray<OrderHistoryInfo *> *orderHistoryArr;

@end

@implementation OrderHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.orderHistoryArr = [[NSMutableArray alloc] init];
    [self fetchOrderHistory];

}

-(void)fetchOrderHistory {
    NSString *apiKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"appapikey"];
    NSString *userId = [[NSUserDefaults standardUserDefaults] stringForKey:@"userId"];
    NSString *mobileNum = [[NSUserDefaults standardUserDefaults] stringForKey:@"mobile"];
    
    [[APIHandler alloc] orderHistoryApiCall:apiKey andUser_Id:userId andMobile:mobileNum withCompletion:^(NSData *result, NSError *error) {
        [[APIParser alloc] orderHistoryParser:result andError:error withCompletion:^(Boolean * _Nonnull hasError, NSMutableArray<OrderHistoryInfo *> * _Nonnull result) {
            if(hasError) {
                NSLog(@"Error");
            }else{
                for(int i = 0; i <result.count; i++){
                    NSLog(@"results: %@", result[i]);
                    [[self orderHistoryArr] addObject:result[i]];
                    
                }
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self.collView reloadData];
                });
            }
            
        }];
        
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OrderHistoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.itemNameLbl.text = _orderHistoryArr[indexPath.row].oItemname;
    cell.oidLbl.text = _orderHistoryArr[indexPath.row].oId;
    cell.shippingAddrLbl.text = _orderHistoryArr[indexPath.row].oBillingadd;
    cell.priceLbl.text = _orderHistoryArr[indexPath.row].oPaidprice;
    cell.oStatusLbl.text = _orderHistoryArr[indexPath.row].oStatus;
    cell.oPlacedLbl.text = _orderHistoryArr[indexPath.row].oPlacedon;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _orderHistoryArr.count;
}

@end

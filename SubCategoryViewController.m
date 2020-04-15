//
//  SubCategoryViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "APIHandler.h"
#import "APIParser.h"
#import "SubCategoryCollectionViewCell.h"
#import "ProductListViewController.h"

@interface SubCategoryViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collView;


@end

@implementation SubCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.subCatImgArray = [[NSMutableArray alloc] init];

    [self fetchSubCategoryInfo];
}

-(void) fetchSubCategoryInfo {
    dispatch_group_t subCatGroup = dispatch_group_create();
    dispatch_group_enter(subCatGroup);
    dispatch_group_t subCatImgGroup = dispatch_group_create();
    [[APIHandler sharedInstance] subCategoryApiCall: [NSUserDefaults.standardUserDefaults stringForKey:@"appapikey"] catID:self.cId andUserId:[NSUserDefaults.standardUserDefaults stringForKey:@"userId"] withCompletion:^(NSData *result, NSError *error) {
        [[APIParser sharedInstance] subCategoryParser:result andError:error withCompletion:^(Boolean * _Nonnull hasError, NSMutableArray<SubCategoryInfo *> * _Nonnull result) {
            if(hasError){
                NSLog(@"Error in fetchSubCategoryInfo");
            }else {
                self.subCatArray = result;
                for(int i = 0; i < result.count; i++) {
                    dispatch_group_enter(subCatImgGroup);
                    [[APIHandler sharedInstance] downloadImg:result[i].scImageUrl withCompletion:^(UIImage *img) {
                        if (img != nil){
                            [self.subCatImgArray addObject:img];
                        } else {
                            [self.subCatImgArray addObject:[UIImage imageNamed:@"Image-2"]];
                        }
                        dispatch_group_leave(subCatImgGroup);
                    }];
                }
            }
            dispatch_group_notify(subCatImgGroup, dispatch_get_main_queue(), ^{
                dispatch_group_leave(subCatGroup);
            });
            dispatch_group_notify(subCatGroup, dispatch_get_main_queue(), ^{
                [self.collView reloadData];
                
            });
        }];
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SubCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.scImageDesciption.text = _subCatArray[indexPath.row].scName;
    cell.subCategoryImage.image = _subCatImgArray[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _subCatImgArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductListViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductListViewController"];
    ctrl.cid = _cId;
    ctrl.scid = _subCatArray[indexPath.row].scId;
    [[self navigationController] pushViewController:ctrl animated:true];
    
}

@end

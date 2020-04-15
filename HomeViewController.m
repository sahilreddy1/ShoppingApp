//
//  HomeViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "HomeViewController.h"
#import "APIHandler.h"
#import "APIParser.h"
#import "CategoryCollectionViewCell.h"
#import "SubCategoryViewController.h"
#import "SignInViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryImgs = [[NSMutableArray alloc] init];
    [self fetchCategoryInfo];
}

-(void)fetchCategoryInfo {
    dispatch_group_t catDispatch = dispatch_group_create();
    dispatch_group_enter(catDispatch);
    dispatch_group_t imgGroupC = dispatch_group_create();

    [[APIHandler sharedInstance] prodCategoryApiCall: [[NSUserDefaults standardUserDefaults] stringForKey: @"appapikey"] andUserId:[[NSUserDefaults standardUserDefaults] stringForKey: @"userId"] withCompletion:^(NSData *result, NSError *error) {
        [[APIParser sharedInstance] prodCategoryParser:result andError:error withCompletion:^(Boolean * _Nonnull hasError, NSMutableArray<CategoryInfo *> * _Nonnull result) {
            if (hasError) {
                NSLog(@"Category Info is missing");
            } else{
                self.categories = result;
                for (int i = 0; i < result.count; i++) {
                    dispatch_group_enter(imgGroupC);
                    [[APIHandler sharedInstance] downloadImg:result[i].cImageUrl withCompletion:^(UIImage *img) {
                        [[self categoryImgs] addObject:img];
                        dispatch_group_leave(imgGroupC);
                    }];
                }
            }
            dispatch_group_notify(imgGroupC, dispatch_get_main_queue(), ^{
                dispatch_group_leave(catDispatch);
            });
            dispatch_group_notify(catDispatch, dispatch_get_main_queue(), ^{
                [self.collView reloadData];
                
            });
        }];
        
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [[self collView] dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.categoryImage.image = self.categoryImgs[indexPath.row];
    cell.categoryTitle.text = self.categories[indexPath.row].cName;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _categoryImgs.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Item Selected");
    SubCategoryViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SubCategoryViewController"];
    ctrl.cId = self.categories[indexPath.row].cId;
    [[self navigationController] pushViewController:ctrl animated:true];
}

- (IBAction)logOutBtnClicked:(id)sender {
    
    NSLog(@"made it to here");
    
    //Reset UserDefaults
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDictionary allKeys]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    SignInViewController *controller = [kMainStoryboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:controller];

    [self.navigationController popToRootViewControllerAnimated:true];
}


@end

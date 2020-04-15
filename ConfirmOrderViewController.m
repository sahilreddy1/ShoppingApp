//
//  ConfirmOrderViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ConfirmOrderViewController.h"
#import "TrackShipmentViewController.h"

@interface ConfirmOrderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *deliveryAddrTF;
@property (weak, nonatomic) IBOutlet UITextField *billingAddrTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)placeOrderBtnClicked:(UIButton *)sender {
    
    NSString * apiKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"appapikey"];
    NSString * userId = [[NSUserDefaults standardUserDefaults] stringForKey:@"userId"];
    [[APIHandler sharedInstance] orderApiCall:apiKey andItem_id:_product.pId andItem_names:_product.pName andItem_quantity:_product.pQuantity andFinal_price:_product.pPrice andUser_id:userId andUser_name:_nameTF.text andBillingadd:_billingAddrTF.text andDeliveryAdd:_mobileTF.text andMobile:_mobileTF.text andEmail:_emailTF.text withCompletion:^(NSData *result, NSError *error) {
        NSLog(@"%@",result);
        [[APIParser sharedInstance] orderParser:result andError:error withCompletion:^(Boolean *hasError, OrderInfo *result) {
            if(hasError){
                NSLog(@"error");
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    TrackShipmentViewController *trackShipmentVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TrackShipmentViewController"];
                    trackShipmentVC.order = result;
                    [self presentViewController:trackShipmentVC animated:true completion:nil];
                });
            }
            
        }];
    }];
}


@end

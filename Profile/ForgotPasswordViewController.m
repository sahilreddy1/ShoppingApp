//
//  ForgotPasswordViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "APIHandler.h"
@interface ForgotPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)forgotPasswordBtnClicked:(UIButton *)sender {
    if(![_emailTF.text isEqualToString:@""]){
        [[APIHandler sharedInstance] forgotPasswordWithEmail:_emailTF.text];
    }else{
        NSLog(@"Empty textfield");  
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

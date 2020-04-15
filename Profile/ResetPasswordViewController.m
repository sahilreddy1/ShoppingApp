//
//  ResetPasswordViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "APIHandler.h"

@interface ResetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *currentPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmNewPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)resetPasswordBtn:(UIButton *)sender {
    if(![_mobileTF.text isEqualToString:@""] && ![_currentPasswordTF.text isEqualToString:@""] && ![_confirmNewPasswordTF.text isEqualToString:@""] && ![_passwordTF.text isEqualToString:@""]){
        if([_confirmNewPasswordTF.text isEqualToString:_passwordTF.text]){
            [[APIHandler sharedInstance] resetPassword:_mobileTF.text password:_currentPasswordTF.text newPassword:_passwordTF.text completionHandler:^(NSString *response) {
                 if ([response isEqual: @"password reset successfully"]) {
                     NSLog(@"success!");
                 } else if ([response isEqual: @"old password mismatch"]) {
                     NSLog(@"old password isn't correct");
                 }else{
                     NSLog(@"error");
                 }
            }];
        }else{
            NSLog(@"Make sure passwords are equal");
        }
    }else{
        NSLog(@"Fill in All Fields");
    }
}



@end

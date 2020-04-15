//
//  SignInViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "SignInViewController.h"
#import "APIHandler.h"
#import "APIParser.h"


@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signInBtn:(UIButton *)sender {
    if (![_mobileNumberTF.text isEqual:@""] && ![_passwordTF.text isEqual:@""]){
        [[APIHandler sharedInstance] signInUser:_mobileNumberTF.text password:_passwordTF.text withCompletion:^(NSData *result, NSError *error) {
            [[APIParser sharedInstance] signInParser:result andError:error withCompletion:^(bool hasError, NSString * _Nonnull errorMsg) {
                            if (hasError) {
                                NSLog(@"error: %@", errorMsg);
                            } else {
                                NSLog(@"No error");
                                NSString *charlieSendString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
                                NSLog(@"result: %@", charlieSendString);
                                dispatch_sync(dispatch_get_main_queue(), ^{
                                    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"HomeNavController"];
                                    [vc setModalPresentationStyle: UIModalPresentationFullScreen];
//                                    [self dismissViewControllerAnimated:true completion:nil];
                                    [self presentViewController:vc animated:true completion:nil];
                                });
                               
                                
                            }
                        }];
         }];
    }
    
}

- (IBAction)signUpBtnClicked:(UIButton *)sender {
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [vc setModalPresentationStyle: UIModalPresentationFullScreen];
    [self dismissViewControllerAnimated:true completion:nil];
    [self presentViewController:vc animated:true completion:nil];
}

@end

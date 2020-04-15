//
//  SignUpViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 3/31/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "SignUpViewController.h"
#import "APIHandler.h"
@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassTF;

@property bool res;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signInBtnClicked:(id)sender {
//    let ctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpController")
//    ctrl.modalPresentationStyle = .fullScreen
//    self.present(ctrl, animated: true, completion: nil)
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"SignInViewController"];
    [vc setModalPresentationStyle: UIModalPresentationFullScreen];
    [self dismissViewControllerAnimated:true completion:nil];//put in a dismiss here
    [self presentViewController:vc animated:true completion:nil];
                        
}

- (IBAction)signUpBtnClicked:(UIButton *)sender {
    APIHandler *o = [[APIHandler alloc] init];
    
    if (![_fNameTF.text  isEqual: @""] && ![_lastNameTF.text  isEqual: @""] && ![_emailTF.text  isEqual: @""] && ![_streetAddressTF.text  isEqual: @""] && ![_mobileNumberTF.text  isEqual: @""] && ![_passwordTF.text  isEqual: @""]){
        if([_passwordTF.text isEqual:_confirmPassTF.text]){
            
        
        [o signUpUserWithFirstName:_fNameTF.text lastName:_lastNameTF.text streetAddress:_streetAddressTF.text password:_passwordTF.text email:_emailTF.text mobile:_mobileNumberTF.text completionHandler:^(NSString *response) {
            
            if ([response isEqualToString:@"successfully registered"]) {
//                [self dismissViewControllerAnimated:true completion:nil];
                NSLog(@"Success");
                UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"SignInViewController"];
                [self presentViewController:vc animated:true completion:nil];
            } else{
                NSLog(@"response = %@", response);
                NSLog(@"error");
            }
            
        }];
        }
    }
       
    
}

@end

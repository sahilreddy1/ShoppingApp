//
//  UpdateProfileViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "UpdateProfileViewController.h"
#import "APIHandler.h"


@interface UpdateProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@end

@implementation UpdateProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)updateProfileClicked:(UIButton *)sender {

    if(![_firstNameTF.text isEqualToString:@""] && ![_lastNameTF.text isEqualToString:@""] && ![_emailTF.text isEqualToString:@""] && ![_mobileTF.text isEqualToString:@""]){
        //come back and update with current street address not @"2"
        [[APIHandler sharedInstance] updateUser:_firstNameTF.text lastName:_lastNameTF.text streetAddress:@"2" email:_emailTF.text mobile:_mobileTF.text completionHandler:^(NSString *response) {
            if([response isEqualToString:@"successfully updated"]){
                NSLog(@"Success in updateprofileclicked");
            }else{
                NSLog(@"erroe updateprofilebtn");
            }
        }];
    }
}


@end

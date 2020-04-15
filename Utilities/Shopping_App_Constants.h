//
//  Shopping_App_Constants.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#ifndef Shopping_App_Constants_h
#define Shopping_App_Constants_h

// API constants
#define kLOGINAPI               @"http://rjtmobile.com/aamir/e-commerce/ios-app/shop_login.php?"
#define kFORGETPWDAPI           @"http://rjtmobile.com/aamir/e-commerce/ios-app/forgot_pass_email.php?"
#define kSIGNUPAPI              @"http://rjtmobile.com/aamir/e-commerce/ios-app/shop_reg.php?"
#define kUPDATEPROFILEAPI       @"http://rjtmobile.com/aamir/e-commerce/ios-app/edit_profile.php?"
#define kRESETPASSWORDAPI       @"http://rjtmobile.com/aamir/e-commerce/ios-app/shop_reset_pass.php?"
#define kCATEGORYAPI            @"http://rjtmobile.com/ansari/shopingcart/ios-ssl/cust_category.php?"
#define kTOPSELLERSAPI          @"http://rjtmobile.com/aamir/e-commerce/ios-app/shop_top_sellers.php?"
#define kPRODUCTAPI             @"http://rjtmobile.com/ansari/shopingcart/ios-ssl/product_details.php?"
#define kSUBCATEGORYAPI         @"http://rjtmobile.com/ansari/shopingcart/ios-ssl/cust_sub_category.php?"
#define kCOUPONAPI              @"http://rjtmobile.com/aamir/e-commerce/ios-app/coupon.php?"
#define kORDERAPI               @"http://rjtmobile.com/aamir/e-commerce/ios-app/orders.php?"
#define kTRACKINGAPI            @"http://rjtmobile.com/aamir/e-commerce/ios-app/shipment_track.php?"
#define kORDERHISTORYAPI        @"http://rjtmobile.com/aamir/e-commerce/ios-app/order_history.php?"

// Login constants
#define kNoDataError            @"There is no data in this object."
#define SUCCESS                 @"Success"
#define PASSWORDERROR           @"Password is not correct."
#define MOBILENOTSIGNEDUP       @"This is mobile is not registered."
#define LOGINFAILURE            @"Login Failed"
#define LOGINSUCCESS            @"Login Succeed"
#define TEXTFIELDINPUTERROR     @"Please fill in all required fields!"
#define FORGOTPWDSUCCESS        @"A password reseting email has been sent successfully!"
#define FORGOTPWDFAILURE        @"Something went wrong, Please try again later!"

#define kMainStoryboard         [UIStoryboard storyboardWithName:@"Main" bundle:nil]


#endif /* Shopping_App_Constants_h */

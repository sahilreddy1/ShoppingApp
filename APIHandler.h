//
//  APIHandler.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 3/31/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface APIHandler : NSObject
+ (instancetype) sharedInstance;

-(void)signUpUserWithFirstName: (NSString *)fname lastName:(NSString *)lname streetAddress: (NSString *)address password: (NSString *)password email: (NSString *)email mobile: (NSString *)mobile completionHandler:(void (^) (NSString *response))completionHandler;

-(void)signInUser: (NSString *)mobile password: (NSString *)password withCompletion:(void (^)(NSData *result, NSError *error))block;

-(void)updateUser: (NSString *)fname lastName:(NSString *)lname streetAddress: (NSString *)address email: (NSString *)email mobile: (NSString *)mobile completionHandler:(void (^) (NSString *response))completionHandler;

-(void) resetPassword:(NSString *)mobile password:(NSString *)password newPassword:(NSString *)newPassword completionHandler:(void (^) (NSString *response))completionHandler;

-(void)forgotPasswordWithEmail: (NSString *)email;

-(void)prodCategoryApiCall:(NSString *)apiKey andUserId:(NSString *)userId withCompletion:(void (^)(NSData *result, NSError *error))block;

- (void)downloadImg:(NSString *)imgUrl withCompletion:(void (^)(UIImage *img))block;

- (void)subCategoryApiCall:(NSString *)apiKey catID:(NSString *)categoryId andUserId:(NSString *)userId withCompletion:(void (^)(NSData *, NSError *))block;

- (void)productApiCall:(NSString *)apiKey andUserId:(NSString *)userId andCategoryId:(NSString *) cid andSubCategoryId:(NSString *) scid withCompletion:(void (^)(NSData *result, NSError *error))block;

- (void)orderApiCall:(NSString *)apiKey andItem_id:(NSString *)item_id andItem_names:(NSString *)item_names andItem_quantity:(NSString *)item_quantity andFinal_price:(NSString *)final_price andUser_id:(NSString *)user_id andUser_name:(NSString *)user_name andBillingadd:(NSString *)billingadd andDeliveryAdd:(NSString *)deliveryadd andMobile:(NSString *)mobile andEmail:(NSString *)email withCompletion:(void (^)(NSData *result, NSError *error))block;

- (void)shipmentTrackApiCall: (NSString *)apiKey andUser_Id:(NSString *)user_Id andOrder_Id:(NSString *) order_Id withCompletion:(void (^) (NSData *result, NSError *error))block;

- (void)orderHistoryApiCall:(NSString *)apiKey andUser_Id:(NSString *)user_Id andMobile:(NSString *) mobile withCompletion:(void (^) (NSData *result, NSError *error)) block;

- (void)topSellersApiCall:(void (^)(NSData *result, NSError *error))block;
@end


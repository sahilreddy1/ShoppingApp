//
//  APIHandler.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 3/31/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "APIHandler.h"
#import <Foundation/Foundation.h>
//#import "Shopping_App_Constants.h"
@interface APIHandler()

@end

@implementation APIHandler

+ (instancetype)sharedInstance
{
    
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


-(void)signUpUserWithFirstName:(NSString *)fname lastName:(NSString *)lname streetAddress:(NSString *)address password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile completionHandler:(void (^) (NSString *response))completionHandler
{
    
    NSString *urlstring = [NSString stringWithFormat:@"%@fname=%@&lname=%@&address=%@&email=%@&mobile=%@&password=%@",kSIGNUPAPI,fname,lname,address,email,mobile,password];
    
    NSLog(@" url string is %@", urlstring);
    
    NSURL *serviceUrl = [NSURL URLWithString: urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: serviceUrl];
    
    [request setHTTPMethod: @"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
      
      dispatch_async(dispatch_get_main_queue(), ^{
          NSLog(@"inside dispatch async block main thread from main thread");
        
        if (error == nil && data != nil) {
            NSString *resp = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
            completionHandler(resp);
        }else{
          completionHandler(@"");
        }
      });

    }];
    [datatask resume];
}


-(void) signInUser: (NSString *)mobile password: (NSString *)password withCompletion:(void (^)(NSData *result, NSError *error))block
{
    NSString *urlstring = [NSString stringWithFormat:@"%@mobile=%@&password=%@",kLOGINAPI,mobile,password];
    NSURL *serviceUrl = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serviceUrl];
    
    [request setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            block(data,error);
    }];
    [dataTask resume];
}

- (void)updateUser:(NSString *)fname lastName:(NSString *)lname streetAddress:(NSString *)address email:(NSString *)email mobile:(NSString *)mobile completionHandler:(void (^)(NSString *))completionHandler
{
    NSString *urlString = [NSString stringWithFormat:@"%@fname=%@&lname=%@&address=address&email=%@&mobile=%@", kUPDATEPROFILEAPI,fname, lname,email,mobile];
    NSLog(@" url string is %@", urlString);
    
    NSURL *serviceUrl = [NSURL URLWithString: urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: serviceUrl];
    
    [request setHTTPMethod: @"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            NSString *resp = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
            completionHandler(resp);
        }
    }];
    [dataTask resume];
    
}

-(void) resetPassword:(NSString *)mobile password:(NSString *)password newPassword:(NSString *)newPassword completionHandler:(void (^) (NSString *response))completionHandler{
    
    NSString *urlString = [NSString stringWithFormat:@"%@?&mobile=%@&password=%@&newpassword=%@",kRESETPASSWORDAPI,mobile,password, newPassword];
    NSLog(@" url string is %@", urlString);
    
    NSURL *serviceUrl = [NSURL URLWithString: urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: serviceUrl];
    
    [request setHTTPMethod: @"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *arr = json[@"msg"];
            NSString *msg = arr[0];
            completionHandler(msg);
        }
    }];
    [dataTask resume];
    
}

-(void)forgotPasswordWithEmail:(NSString *)email{
    NSString *urlString = [NSString stringWithFormat:@"%@?email=%@",kFORGETPWDAPI,email];
    NSURL *serviceUrl = [NSURL URLWithString: urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: serviceUrl];
    
    [request setHTTPMethod: @"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"success");
        }else{
            NSLog(@"Error found");
        }
    }];
    [dataTask resume];
}

- (void)prodCategoryApiCall:(NSString *)apiKey andUserId:(NSString *)userId withCompletion:(void (^)(NSData *, NSError *))block{
    NSString *urlString = [NSString stringWithFormat:@"%@api_key=%@&user_id=%@", kCATEGORYAPI, apiKey, userId];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}

- (void)subCategoryApiCall:(NSString *)apiKey catID:(NSString *)categoryId andUserId:(NSString *)userId withCompletion:(void (^)(NSData *, NSError *))block{
    NSString *urlString = [NSString stringWithFormat:@"%@Id=%@&api_key=%@&user_id=%@", kSUBCATEGORYAPI, categoryId, apiKey, userId];
    NSLog(@"urlstring: %@", urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data,error);
    }];
    [dataTask resume];
}

- (void)downloadImg:(NSString *)imgUrl withCompletion:(void (^)(UIImage *))block{
    NSURL *url = [NSURL URLWithString:imgUrl];
    UIImage *img = nil;
    
    @try {
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        img = [UIImage imageWithData:imgData];
        block(img);
    } @catch (NSException *exception) {
        NSLog(@"Error");
        block(img);
    } @finally {
        NSLog(@"trycatch in download image done");
    }
}

- (void)productApiCall:(NSString *)apiKey andUserId:(NSString *)userId andCategoryId:(NSString *) cid andSubCategoryId:(NSString *) scid withCompletion:(void (^)(NSData *result, NSError *error))block{
    NSString *strURL = [NSString stringWithFormat:@"%@cid=%@&scid=%@&api_key=%@&user_id=%@", kPRODUCTAPI, cid, scid, apiKey, userId];
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}

- (void)orderApiCall:(NSString *)apiKey andItem_id:(NSString *)item_id andItem_names:(NSString *)item_names andItem_quantity:(NSString *)item_quantity andFinal_price:(NSString *)final_price andUser_id:(NSString *)user_id andUser_name:(NSString *)user_name andBillingadd:(NSString *)billingadd andDeliveryAdd:(NSString *)deliveryadd andMobile:(NSString *)mobile andEmail:(NSString *)email withCompletion:(void (^)(NSData *result, NSError *error))block{
    NSString *strURL = [NSString stringWithFormat:@"%@api_key=%@&item_id=%@&item_names=%@&item_quantity=%@&final_price=%@&user_id=%@&user_name=%@&billingadd=%@&deliveryadd=%@&mobile=%@&email=%@", kORDERAPI,apiKey,item_id,item_names,item_quantity,final_price,user_id,user_name,billingadd,deliveryadd,mobile,email];
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}

- (void)shipmentTrackApiCall:(NSString *)apiKey andUser_Id:(NSString *)user_Id andOrder_Id:(NSString *)order_Id withCompletion:(void (^)(NSData *, NSError *))block {
    NSString *strURL = [NSString stringWithFormat:@"%@api_key=%@&user_id=%@&order_id=%@", kTRACKINGAPI,apiKey, user_Id, order_Id];
    NSURL *url = [NSURL URLWithString:strURL];
    NSLog(@"%@", strURL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}
- (void)orderHistoryApiCall:(NSString *)apiKey andUser_Id:(NSString *)user_Id andMobile:(NSString *)mobile withCompletion:(void (^)(NSData *, NSError *))block {
    NSString *strURL = [NSString stringWithFormat:@"%@api_key=%@&user_id=%@&mobile=%@", kORDERHISTORYAPI,apiKey, user_Id, mobile];
    NSURL *url = [NSURL URLWithString:strURL];
    NSLog(@"%@", strURL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}

- (void)topSellersApiCall:(void (^)(NSData *result, NSError *error))block {
    NSString *strURL = kTOPSELLERSAPI;
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];
    [dataTask resume];
}
@end

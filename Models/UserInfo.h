//
//  UserInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

@property NSString* userId;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* email;
@property NSString* mobile;
@property NSString* appapikey;

- (instancetype)initWithInfo:(NSString *)userId andFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andMobile: (NSString*)mobile andAppApiKey:(NSString*)appapikey;

@end

NS_ASSUME_NONNULL_END

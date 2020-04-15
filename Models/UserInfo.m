//
//  UserInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/1/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (instancetype) initWithInfo:(NSString *)userId andFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andMobile:(NSString *)mobile andAppApiKey:(NSString *)appapikey {
    self = [super init];
    if (self) {
        self.userId = userId;
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.mobile = mobile;
        self.appapikey = appapikey;
    }
    return self;
}
@end

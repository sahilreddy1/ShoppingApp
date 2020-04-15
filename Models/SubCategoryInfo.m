//
//  SubCategoryInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "SubCategoryInfo.h"

@implementation SubCategoryInfo

- (instancetype)initWithSCid:(NSString *)scId andSCategoryName:(NSString *)scName andSCategoryDescription:(NSString *)scDiscription andSCategoryImageUrl:(NSString *)scImageUrl
{
    self = [super init];
    
    if(self) {
        self.scId = scId;
        self.scName = scName;
        self.scDiscription = scDiscription;
        self.scImageUrl = scImageUrl;
    }
    
    return self;
}

@end

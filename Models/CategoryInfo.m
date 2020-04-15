//
//  CategoryInfo.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "CategoryInfo.h"

@implementation CategoryInfo

- (instancetype)initWithInfo:(NSString *)cId andCategoryName:(NSString *)cName andCategoryDescription:(NSString *)cDescription andCategoryImageUrl:(NSString *)cImageUrl {
    self = [super init];
    if(self) {
        self.cId = cId;
        self.cName = cName;
        self.cDescription = cDescription;
        self.cImageUrl = cImageUrl;
    }
    return self;
}

@end

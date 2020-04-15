//
//  CategoryInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryInfo : NSObject
@property NSString* cId;
@property NSString* cName;
@property NSString* cDescription;
@property NSString* cImageUrl;

- (instancetype)initWithInfo:(NSString *)cId andCategoryName:(NSString *)cName andCategoryDescription:(NSString *)cDescription andCategoryImageUrl:(NSString *)cImageUrl;

@end

NS_ASSUME_NONNULL_END

//
//  SubCategoryInfo.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubCategoryInfo : NSObject

@property NSString* scId;
@property NSString* scName;
@property NSString* scDiscription;
@property NSString* scImageUrl;

- (instancetype)initWithSCid:(NSString *)scId andSCategoryName:(NSString *)scName andSCategoryDescription:(NSString *)scDiscription andSCategoryImageUrl:(NSString *)scImageUrl;

@end

NS_ASSUME_NONNULL_END

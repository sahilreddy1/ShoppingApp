//
//  TrackShipmentViewController.h
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderInfo.h"
#import "APIHandler.h"
NS_ASSUME_NONNULL_BEGIN

@interface TrackShipmentViewController : UIViewController
@property OrderInfo *order;
@end

NS_ASSUME_NONNULL_END

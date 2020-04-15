//
//  TrackShipmentViewController.m
//  ShoppingApp
//
//  Created by Sahil Reddy on 4/6/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

#import "TrackShipmentViewController.h"
#import "ShipmentTrackInfo.h"
#import "APIParser.h"

@interface TrackShipmentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *idShipmentLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;

@end

@implementation TrackShipmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchTracking];
}

- (void)fetchTracking {
    NSString * apiKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"appapikey"];
    NSString * userId = [[NSUserDefaults standardUserDefaults] stringForKey:@"userId"];
    
    [[APIHandler alloc] shipmentTrackApiCall:apiKey andUser_Id:userId andOrder_Id: _order.oId withCompletion:^(NSData *result, NSError *error) {
        [[APIParser alloc] trackerParser:result andError:error withCompletion:^(Boolean * _Nonnull hasError, ShipmentTrackInfo * _Nonnull result) {
            if(hasError) {
                NSLog(@"error");
            }else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSString *shipmentStr;
                    if([result.shipmentStatus isEqualToString:@"1"]) {
                        shipmentStr = @"Order Confirmed";
                    }else if([result.shipmentStatus isEqualToString:@"2"]){
                        shipmentStr = @"Order Dispatched";
                    }else if([result.shipmentStatus isEqualToString:@"3"]){
                        shipmentStr = @"Order is on the way";
                    }else if([result.shipmentStatus isEqualToString:@"4"]){
                        shipmentStr = @"Order Delivered";
                    }else{
                        shipmentStr = @"Order Updating";
                    }
                    self->_idShipmentLbl.text = result.shipmentId;
                    self->_statusLbl.text = shipmentStr;
                    [self.view setNeedsLayout];
                });
            }
        }];
    }];
}

@end

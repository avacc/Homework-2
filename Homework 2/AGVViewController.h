//
//  AGVViewController.h
//  Homework 2
//
//  Created by Alex on 2/17/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVLocationManager.h"
#import <UIKit/UIKit.h>


@interface AGVViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) locationManager: (CLLocation*) manager didUpdateLocations: (NSArray*) locations;
- (void) addPinToMapAtLocation: (CLLocation*) location;
@end

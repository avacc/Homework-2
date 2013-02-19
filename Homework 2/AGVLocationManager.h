//
//  AGVLocationManager.h
//  Homework 2
//
//  Created by Alex on 2/18/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AGVLocationManager : NSObject

+ (CLLocationManager*) sharedLocationManager;

@end

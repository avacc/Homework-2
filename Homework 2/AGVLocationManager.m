//
//  AGVLocationManager.m
//  Homework 2
//
//  Created by Alex on 2/18/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVLocationManager.h"

@implementation AGVLocationManager

static CLLocationManager* locationManager = nil;

+ (CLLocationManager*) sharedLocationManager
{
    if(!locationManager){
        locationManager = [[CLLocationManager alloc] init];
    }
    return locationManager;
}

@end

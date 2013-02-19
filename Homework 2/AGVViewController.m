//
//  AGVViewController.m
//  Homework 2
//
//  Created by Alex on 2/17/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVViewController.h"

@interface AGVViewController ()
@end

@implementation AGVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if([AGVLocationManager sharedLocationManager].locationServicesEnabled == NO){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Location Services Alert"
                                                        message: @"Please go to Settings and enable Location Services" delegate: self cancelButtonTitle: @"Dismiss"otherButtonTitles: nil];
        
        [alert show];
    }
    [AGVLocationManager sharedLocationManager].delegate = self;
    [AGVLocationManager sharedLocationManager].desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [AGVLocationManager sharedLocationManager].distanceFilter = 1000.0f;    
    [[AGVLocationManager sharedLocationManager] startUpdatingLocation];

    MKCoordinateSpan span;
    span.latitudeDelta = 0.040;
    span.longitudeDelta = 0.040;
    MKCoordinateRegion region;
    region.span = span;
    region.center = [AGVLocationManager sharedLocationManager].location.coordinate;
    [self.mapView setRegion: region animated: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods

- (void) locationManager: (CLLocationManager*) manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* location = [locations lastObject];
    NSLog(@"lat: %f, lon: %f", location.coordinate.latitude, location.coordinate.longitude);
    [self addPinToMapAtLocation: location];
}

- (void) addPinToMapAtLocation: (CLLocation*) location
{
    MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    pin.title = @"Pin Title";
    pin.subtitle = @"Pin Subtitle";
    [self.mapView addAnnotation: pin];
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
}

@end

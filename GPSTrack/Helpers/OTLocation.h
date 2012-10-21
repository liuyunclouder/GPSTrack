//
//  OTLocation.h
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface OTLocation : NSObject

@property(assign, nonatomic) CLLocationCoordinate2D coordinate;
@property(assign, nonatomic) CLLocationDistance altitude;
@property(assign, nonatomic) CLLocationAccuracy horizontalAccuracy;
@property(assign, nonatomic) CLLocationAccuracy verticalAccuracy;
@property(assign, nonatomic) CLLocationDirection course __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_2_2);
@property(assign, nonatomic) CLLocationSpeed speed __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_2_2);
@property(retain, nonatomic) NSDate *timestamp;

+ (OTLocation *)otLocationFromCLLocation:(CLLocation *)clLocation;

@end

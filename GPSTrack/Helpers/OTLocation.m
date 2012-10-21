//
//  OTLocation.m
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import "OTLocation.h"
#import <CoreLocation/CoreLocation.h>

#define COORD_Lat_Key               @"CDXK"
#define COORD_Log_Key               @"CDYK"
#define Altitude_Key                @"AK"
#define Horizontal_Accuracy_Key     @"HAK"
#define Vertical_Accuracy_Key       @"VAK"
#define Direction_Key               @"DK"
#define Speed_Key                   @"SK"
#define Date_Key                    @"DAK"



@implementation OTLocation

//@property(assign, nonatomic) CLLocationCoordinate2D coordinate;
//@property(assign, nonatomic) CLLocationDistance altitude;
//@property(assign, nonatomic) CLLocationAccuracy horizontalAccuracy;
//@property(assign, nonatomic) CLLocationAccuracy verticalAccuracy;
//@property(assign, nonatomic) CLLocationDirection course __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_2_2);
//@property(assign, nonatomic) CLLocationSpeed speed __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_2_2);
//@property(assign, nonatomic) NSDate *timestamp;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coordinate.latitude] forKey:COORD_Lat_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coordinate.longitude] forKey:COORD_Log_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.altitude] forKey:Altitude_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.horizontalAccuracy] forKey:Horizontal_Accuracy_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.verticalAccuracy] forKey:Vertical_Accuracy_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.course] forKey:Direction_Key];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.speed] forKey:Speed_Key];
    [aCoder encodeObject:self.timestamp forKey:Date_Key];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    CLLocationCoordinate2D coordinate;
    coordinate.longitude = [[aDecoder decodeObjectForKey:COORD_Lat_Key] doubleValue];
    coordinate.latitude = [[aDecoder decodeObjectForKey:COORD_Log_Key] doubleValue];
    self.coordinate = coordinate;
    self.altitude = [[aDecoder decodeObjectForKey:Altitude_Key] doubleValue];
    self.horizontalAccuracy = [[aDecoder decodeObjectForKey:Horizontal_Accuracy_Key] doubleValue];
    self.verticalAccuracy = [[aDecoder decodeObjectForKey:Vertical_Accuracy_Key] doubleValue];
    self.course = [[aDecoder decodeObjectForKey:Direction_Key] doubleValue];
    self.speed = [[aDecoder decodeObjectForKey:Speed_Key] doubleValue];
    self.timestamp = [aDecoder decodeObjectForKey:Date_Key];
    return self;
}

+ (OTLocation *)otLocationFromCLLocation:(CLLocation *)clLocation
{
    OTLocation *otl = [[OTLocation alloc] init];
    otl.coordinate = clLocation.coordinate;
    otl.altitude = clLocation.altitude;
    otl.horizontalAccuracy = clLocation.horizontalAccuracy;
    otl.verticalAccuracy = clLocation.verticalAccuracy;
    otl.course = clLocation.course;
    otl.speed = clLocation.speed;
    otl.timestamp = clLocation.timestamp;
    return otl;
}

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString string];
    [descriptionString stringByAppendingFormat:@"经度:%f 纬度:%f", self.coordinate.latitude, self.coordinate.longitude];
    return [NSString stringWithString:descriptionString];
}

@end

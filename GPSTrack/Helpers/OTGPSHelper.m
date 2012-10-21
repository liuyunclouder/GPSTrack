//
//  OTGPSHelper.m
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import "OTGPSHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface OTGPSHelper() <CLLocationManagerDelegate>
@property (nonatomic,retain) CLLocationManager *localtionManager;
@property (nonatomic,assign) id<OTGPSHelperDelegate> delegate;
@end

@implementation OTGPSHelper

+ (OTGPSHelper *)instance
{
    static OTGPSHelper *helper;
    if (!helper)
    {
        helper = [[OTGPSHelper alloc] init];
        helper.localtionManager = [[CLLocationManager alloc] init];
        helper.localtionManager.delegate = helper;
    }
    return helper;
}

+ (void)beginUpDateGPSInfo
{
    if ([CLLocationManager significantLocationChangeMonitoringAvailable])
    {
        [[[OTGPSHelper instance] localtionManager] startMonitoringSignificantLocationChanges];
    }
}

+ (void)setDelegate:(id<OTGPSHelperDelegate>)delegate
{
    [OTGPSHelper instance].delegate = delegate;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if ([self.delegate respondsToSelector:@selector(didUpdateLocations:)])
    {
        [self.delegate didUpdateLocations:locations];
    }
}

@end

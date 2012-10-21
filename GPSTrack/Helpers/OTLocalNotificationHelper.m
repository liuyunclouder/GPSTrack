//
//  OTLocalNotificationHelper.m
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import "OTLocalNotificationHelper.h"

@implementation OTLocalNotificationHelper

+ (void)directNotificationWithString:(NSString *)string
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate date];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.alertBody = string;
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end

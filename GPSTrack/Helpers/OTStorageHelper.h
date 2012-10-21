//
//  OTStorageHelper.h
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTLocation.h"

@interface OTStorageHelper : NSObject

+ (BOOL)saveToDisk;

+ (void)wakeFromDisk;

+ (NSArray *)locationArray;

+ (void)addLocation:(CLLocation *)location;

@end

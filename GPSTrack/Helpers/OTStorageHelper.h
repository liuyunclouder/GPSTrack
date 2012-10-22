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

//如果此次添加和上次坐标一样，则不更新，也不添加
+ (BOOL)addLocation:(CLLocation *)location;

@end

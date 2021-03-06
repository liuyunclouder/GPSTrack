//
//  OTStorageHelper.m
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import "OTStorageHelper.h"

@interface OTStorageHelper()
@property (nonatomic,retain) NSMutableArray *locationArray;
@end

@implementation OTStorageHelper

+ (OTStorageHelper *)instance
{
    static OTStorageHelper *instance;
    if (!instance)
    {
        instance = [[OTStorageHelper alloc] init];
        instance.locationArray = [NSMutableArray array];
    }
    return instance;
}

+ (NSString *)storageFilePath
{
    NSString *dirPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    dirPath = [dirPath stringByAppendingPathComponent:@"GPSTrack.plist"];
    return dirPath;
}

+ (BOOL)saveToDisk
{
    NSString *savingPath = [OTStorageHelper storageFilePath];
    NSMutableArray *mutableArray = [OTStorageHelper instance].locationArray;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mutableArray];
    BOOL successed = [[NSFileManager defaultManager] createFileAtPath:savingPath contents:data attributes:nil];
    return successed;
}

+ (void)wakeFromDisk
{
    NSString *arrayPath = [OTStorageHelper storageFilePath];
    NSData *data = [[NSData alloc] initWithContentsOfFile:arrayPath];
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (array)
    {
        [OTStorageHelper instance].locationArray = array;
    }
}

+ (NSArray *)locationArray
{
    NSMutableArray *array = [OTStorageHelper instance].locationArray;
    return [NSArray arrayWithArray:array];
}

//如果此次添加和上次坐标一样，则不更新，也不添加
+ (BOOL)addLocation:(CLLocation *)location
{
    NSMutableArray *array = [OTStorageHelper instance].locationArray;
    CLLocation *lastLocation = array.lastObject;
    if (lastLocation)
    {
        CLLocationDistance distance = [lastLocation distanceFromLocation:location];
        if (distance == 0.0f) {
            return NO;
        }
    }
    [array addObject:location];
    [OTStorageHelper saveToDisk];
    return YES;
}

@end

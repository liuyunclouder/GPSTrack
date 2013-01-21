//
//  OTGPSHelper.h
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//  Requires iOS 4.2+

#import <Foundation/Foundation.h>

@protocol OTGPSHelperDelegate <NSObject>

- (void)didUpdateLocations:(NSArray *)locations;

@end

@interface OTGPSHelper : NSObject

//Check has permission access GPS info
+ (BOOL)isLocationServiceAccessble;

//begin update gps
+ (void)beginUpDateGPSInfo;

//set delegate
+ (void)setDelegate:(id<OTGPSHelperDelegate>)delegate;

@end

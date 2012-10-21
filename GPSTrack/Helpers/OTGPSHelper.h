//
//  OTGPSHelper.h
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OTGPSHelperDelegate <NSObject>

- (void)didUpdateLocations:(NSArray *)locations;

@end

@interface OTGPSHelper : NSObject

+ (void)beginUpDateGPSInfo;
+ (void)setDelegate:(id<OTGPSHelperDelegate>)delegate;

@end

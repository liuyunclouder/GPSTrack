//
//  OTGPSInfoViewController.m
//  GPSTrack
//
//  Created by OpenThread on 10/21/12.
//  Copyright (c) 2012 OpenThread. All rights reserved.
//

#import "OTGPSInfoViewController.h"
#import "OTStorageHelper.h"
#import "OTGPSHelper.h"
#import "OTLocalNotificationHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface OTGPSInfoViewController()<OTGPSHelperDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation OTGPSInfoViewController
{
    NSArray *_dataSourceArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateTableView];
    [OTGPSHelper beginUpDateGPSInfo];
    [OTGPSHelper setDelegate:self];
}

- (void)updateTableView
{
    _dataSourceArray = [OTStorageHelper locationArray];
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MoveCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.numberOfLines = 0;
    }
    CLLocation *location = _dataSourceArray[indexPath.row];
    cell.textLabel.text = [location description];
	return cell;

}

- (void)didUpdateLocations:(NSArray *)locations
{
    CLLocation *object = locations[0];
    if([OTStorageHelper addLocation:object])
    {
        [self updateTableView];
        [OTLocalNotificationHelper directNotificationWithString:[object description]];
    }
}

@end

//
//  User.h
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface User : NSObject
//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@property (nonatomic, strong) NSString *name;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, getter=isOnline) BOOL isOnline;
@property (nonatomic, strong) NSArray *favourites;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) NSURL *proileImgURL;
@end
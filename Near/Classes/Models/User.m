//
//  User.m
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "User.h"

@implementation User
//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@synthesize name = _name, coordinate = _coordinate, isOnline = _isOnline, favourites = _favourites, friends = _friends, proileImgURL = _proileImgURL;

//===========================================================
//  name
//===========================================================
- (NSString *) name
{
    //NSLog(@"%s:    returned _name = %@", __FUNCTION__, _name);
    
    return _name;
}
- (void) setName: (NSString *) aName
{
    //NSLog(@"%s:   old value of _name: %@, changed to: %@", __FUNCTION__, _name, aName);
    
    if (_name != aName)
    {
        _name = aName;
    }
}

//===========================================================
//  coordinate
//===========================================================
- (CLLocationCoordinate2D) coordinate
{
    //NSLog(@"%s:    returned _coordinate = (null)", __FUNCTION__, _coordinate);
    
    return _coordinate;
}

- (void) setCoordinate: (CLLocationCoordinate2D) aCoordinate
{
    //NSLog(@"%s:   old value of _coordinate: (null), changed to: (null)", __FUNCTION__, _coordinate, aCoordinate);
    
    if (_coordinate.longitude != aCoordinate.longitude || _coordinate.latitude != aCoordinate.latitude)
    {
        _coordinate = aCoordinate;
    }
}

//===========================================================
//  isOnline
//===========================================================
- (BOOL) isOnline
{
    //NSLog(@"%s:    returned _isOnline = %@", __FUNCTION__, _isOnline ? @"YES": @"NO" );
    
    return _isOnline;
}

- (void) setOnline: (BOOL) flag
{
    //NSLog(@"%s:   old value of _isOnline: %@, changed to: %@", __FUNCTION__, (_isOnline ? @"YES": @"NO"), (flag ? @"YES": @"NO") );
    
    if (_isOnline != flag)
    {
        _isOnline = flag;
    }
}

//===========================================================
//  favourites
//===========================================================
- (NSArray *) favourites
{
    //NSLog(@"%s:    returned _favourites = %@", __FUNCTION__, _favourites);
    
    return _favourites;
}

- (void) setFavourites: (NSArray *) aFavourites
{
    //NSLog(@"%s:   old value of _favourites: %@, changed to: %@", __FUNCTION__, _favourites, aFavourites);
    
    if (_favourites != aFavourites)
    {
        _favourites = aFavourites;
    }
}

//===========================================================
//  friends
//===========================================================
- (NSArray *) friends
{
    //NSLog(@"%s:    returned _friends = %@", __FUNCTION__, _friends);
    
    return _friends;
}

- (void) setFriends: (NSArray *) aFriends
{
    //NSLog(@"%s:   old value of _friends: %@, changed to: %@", __FUNCTION__, _friends, aFriends);
    
    if (_friends != aFriends)
    {
        _friends = aFriends;
    }
}

//===========================================================
//  proileImgURL
//===========================================================
- (NSURL *) proileImgURL
{
    //NSLog(@"%s:    returned _proileImgURL = %@", __FUNCTION__, _proileImgURL);
    
    return _proileImgURL;
}

- (void) setProileImgURL: (NSURL *) aProileImgURL
{
    //NSLog(@"%s:   old value of _proileImgURL: %@, changed to: %@", __FUNCTION__, _proileImgURL, aProileImgURL);
    
    if (_proileImgURL != aProileImgURL)
    {
        _proileImgURL = aProileImgURL;
    }
}


@end

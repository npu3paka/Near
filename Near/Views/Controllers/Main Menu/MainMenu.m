//
//  MainMenu.m
//  Near
//
//  Created by 158ltd Developer on 2/1/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu

//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@synthesize mapButton = _mapButton, favouritesButton = _favouritesButton, profileButton = _profileButton;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawView];
    }
    return self;
}

-(void)drawView {
    
    
    CGFloat width = self.width/3 - 10*3;
    
    _mapButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width, 45)];
    
    _favouritesButton = [[UIButton alloc] initWithFrame:CGRectMake(_mapButton.right + 10.0f, 0, width, 45)];
    
    _profileButton = [[UIButton alloc] initWithFrame:CGRectMake(_favouritesButton.right + 10.0f, 0, width, 45)];
    
    [_mapButton setTitle:@"Map" forState:UIControlStateNormal];
    [_favouritesButton setTitle:@"Favourites" forState:UIControlStateNormal];
    [_profileButton setTitle:@"Profile" forState:UIControlStateNormal];
    
    [_mapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_favouritesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_mapButton];
    [self addSubview:_favouritesButton];
    [self addSubview:_profileButton];
}

@end

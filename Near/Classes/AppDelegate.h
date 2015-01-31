//
//  AppDelegate.h
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeteorClient;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MeteorClient *meteorClient;

@end


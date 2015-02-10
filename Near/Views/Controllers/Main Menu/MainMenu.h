//
//  MainMenu.h
//  Near
//
//  Created by 158ltd Developer on 2/1/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenu : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic) UIButton *mapButton;
@property (nonatomic) UIButton *favouritesButton;
@property (nonatomic) UIButton *profileButton;

@end

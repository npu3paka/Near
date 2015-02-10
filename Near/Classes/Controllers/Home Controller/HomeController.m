//
//  HomeController.m
//  Near
//
//  Created by 158ltd Developer on 2/1/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "HomeController.h"
#import "MainMenu.h"

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawView];
}


- (void) drawView {
    MainMenu *menu = [[MainMenu alloc]initWithFrame:CGRectMake(0, 100, self.view.width, 45)];
    
    [self.view addSubview:menu];
}

@end

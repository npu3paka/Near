//
//  MyManager.m
//  Near
//
//  Created by 158ltd Developer on 2/1/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "MyManager.h"

@implementation MyManager

+ (id) sharedManager {
    static MyManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

@end

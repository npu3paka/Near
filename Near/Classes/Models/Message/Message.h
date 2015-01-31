//
//  Message.h
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Message : NSObject
//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *date;
@property (nonatomic) NSUInteger sentFrom;
@end

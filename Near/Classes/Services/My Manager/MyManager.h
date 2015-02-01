//
//  MyManager.h
//  Near
//
//  Created by 158ltd Developer on 2/1/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyManager : NSObject {
    
    //MeteorClient *meteorClient;

}

+ (id)sharedManager;

@property (strong, nonatomic) MeteorClient *meteor;

@end

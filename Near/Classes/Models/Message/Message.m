//
//  Message.m
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "Message.h"

@implementation Message
//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@synthesize message = _message, date = _date, sendedFrom = _sendedFrom;


//===========================================================
//  message
//===========================================================
- (NSString *) message
{
    //NSLog(@"%s:    returned _message = %@", __FUNCTION__, _message);
    
    return _message;
}
- (void) setMessage: (NSString *) aMessage
{
    //NSLog(@"%s:   old value of _message: %@, changed to: %@", __FUNCTION__, _message, aMessage);
    
    if (_message != aMessage)
    {
        _message = aMessage;
    }
}
//===========================================================
//  date
//===========================================================
- (NSString *) date
{
    //NSLog(@"%s:    returned _date = %@", __FUNCTION__, _date);
    
    return _date;
}
- (void) setDate: (NSString *) aDate
{
    //NSLog(@"%s:   old value of _date: %@, changed to: %@", __FUNCTION__, _date, aDate);
    
    if (_date != aDate)
    {
        _date = aDate;
    }
}
//===========================================================
//  sendedFrom
//===========================================================
- (NSUInteger) sendedFrom
{
    //NSLog(@"%s:    returned _sendedFrom = %lu", __FUNCTION__, _sendedFrom);
    
    return _sendedFrom;
}
- (void) setSendedFrom: (NSUInteger) aSendedFrom
{
    //NSLog(@"%s:   old value of _sendedFrom: %lu, changed to: %lu", __FUNCTION__, _sendedFrom, aSendedFrom);
    
    if (_sendedFrom != aSendedFrom)
    {
        _sendedFrom = aSendedFrom;
    }
}

@end

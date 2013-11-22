//
//  Event.h
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EventType) {
    EventTypeChemo,
    EventTypeImaging,
    EventTypeLabTest,
    EventTypeRadiation,
    EventTypeSurgery
};

@interface Event : NSObject

@property EventType eventType;
@property NSString *procedureName;
@property NSString *location;
@property NSDate *dateTime;

@end

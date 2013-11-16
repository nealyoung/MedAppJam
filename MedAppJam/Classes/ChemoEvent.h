//
//  ChemoEvent.h
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "Event.h"

@interface ChemoEvent : Event <NSCoding>

+ (ChemoEvent *)sampleEvent;

@property NSString *timeline;
@property NSString *mechanism;
@property NSString *sideEffects;

@end

//
//  RadiationEvent.h
//  MedAppJam
//
//  Created by Nealon Young on 11/22/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "Event.h"

@interface RadiationEvent : Event <NSCoding>

@property NSString *information;
@property NSString *timeline;
@property NSString *sideEffects;

@end

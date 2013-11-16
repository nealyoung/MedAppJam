//
//  LabTestEvent.h
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "Event.h"

@interface LabTestEvent : Event <NSCoding>

+ (LabTestEvent *)sampleEvent;

@property NSString *information;
@property NSString *howTested;
@property NSString *values;
@property NSString *interpretation;

@end

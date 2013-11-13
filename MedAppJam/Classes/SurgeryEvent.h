//
//  SurgeryEvent.h
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "Event.h"

@interface SurgeryEvent : Event

+ (SurgeryEvent *)sampleEvent;

@property NSString *information;
@property NSString *preparation;
@property NSString *recovery;

@end

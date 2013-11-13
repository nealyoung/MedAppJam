//
//  ChemoEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "ChemoEvent.h"

@implementation ChemoEvent

+ (ChemoEvent *)sampleEvent {
    ChemoEvent *chemoEvent = [[ChemoEvent alloc] init];
    
    chemoEvent.eventType = EventTypeChemo;
    chemoEvent.procedureName = @"Cyclophosphamide";
    chemoEvent.location = @"Quest Diagnostics\n4050 Barranca Pkwy.\nIrvine, CA 92604";
    chemoEvent.dateTime = [NSDate dateWithTimeInterval:150000 sinceDate:[NSDate date]];
    chemoEvent.timeline = @"1 day?";
    chemoEvent.mechanism = @"chemicals";
    chemoEvent.sideEffects = @"bad stuff";
    
    return chemoEvent;
}

@end

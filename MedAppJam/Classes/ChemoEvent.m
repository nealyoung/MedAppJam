//
//  ChemoEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "ChemoEvent.h"

@implementation ChemoEvent

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        self.eventType = [[decoder decodeObjectForKey:@"eventType"] integerValue];
        self.dateTime = [decoder decodeObjectForKey:@"dateTime"];
        self.procedureName = [decoder decodeObjectForKey:@"procedureName"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.timeline = [decoder decodeObjectForKey:@"timeline"];
        self.mechanism = [decoder decodeObjectForKey:@"mechanism"];
        self.sideEffects = [decoder decodeObjectForKey:@"sideEffects"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.eventType] forKey:@"eventType"];
    [encoder encodeObject:self.dateTime forKey:@"dateTime"];
    [encoder encodeObject:self.procedureName forKey:@"procedureName"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.timeline forKey:@"timeline"];
    [encoder encodeObject:self.mechanism forKey:@"mechanism"];
    [encoder encodeObject:self.sideEffects forKey:@"sideEffects"];
}

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

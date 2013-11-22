//
//  RadiationEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/22/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "RadiationEvent.h"

@implementation RadiationEvent

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        self.eventType = [[decoder decodeObjectForKey:@"eventType"] integerValue];
        self.dateTime = [decoder decodeObjectForKey:@"dateTime"];
        self.procedureName = [decoder decodeObjectForKey:@"procedureName"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.information = [decoder decodeObjectForKey:@"information"];
        self.timeline = [decoder decodeObjectForKey:@"timeline"];
        self.sideEffects = [decoder decodeObjectForKey:@"sideEffects"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.eventType] forKey:@"eventType"];
    [encoder encodeObject:self.dateTime forKey:@"dateTime"];
    [encoder encodeObject:self.procedureName forKey:@"procedureName"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.information forKey:@"information"];
    [encoder encodeObject:self.timeline forKey:@"timeline"];
    [encoder encodeObject:self.sideEffects forKey:@"sideEffects"];
}

@end

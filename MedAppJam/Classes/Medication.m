//
//  Medication.m
//  MedAppJam
//
//  Created by Nealon Young on 11/21/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "Medication.h"

@implementation Medication

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.dosage = [decoder decodeObjectForKey:@"dosage"];
        self.notes = [decoder decodeObjectForKey:@"notes"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.dosage forKey:@"dosage"];
    [encoder encodeObject:self.notes forKey:@"notes"];
}

@end

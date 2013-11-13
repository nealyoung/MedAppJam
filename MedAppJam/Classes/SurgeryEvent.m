//
//  SurgeryEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "SurgeryEvent.h"

@implementation SurgeryEvent

+ (SurgeryEvent *)sampleEvent {
    SurgeryEvent *surgeryEvent = [[SurgeryEvent alloc] init];
    
    surgeryEvent.eventType = EventTypeSurgery;
    surgeryEvent.procedureName = @"Pneumonectomy";
    surgeryEvent.location = @"UC Irvine Medical Center\n101 The City Dr. South\nOrange, CA 92868";
    surgeryEvent.dateTime = [NSDate dateWithTimeInterval:2000000 sinceDate:[NSDate date]];
    surgeryEvent.information = @"No more lung";
    surgeryEvent.preparation = @"prep";
    surgeryEvent.recovery = @"no lung";
    
    return surgeryEvent;
}

@end

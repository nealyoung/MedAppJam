//
//  LabTestEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "LabTestEvent.h"

@implementation LabTestEvent

+ (LabTestEvent *)sampleEvent {
    LabTestEvent *labTestEvent = [[LabTestEvent alloc] init];
    
    labTestEvent.eventType = EventTypeLabTest;
    labTestEvent.procedureName = @"Carcinoembryonic Antigen (CEA)";
    labTestEvent.location = @"Quest Diagnostics\n4050 Barranca Pkwy.\nIrvine, CA 92604";
    labTestEvent.dateTime = [NSDate date];
    labTestEvent.information = @"CEA is a lab test";
    labTestEvent.howTested = @"CEA is tested with blood";
    labTestEvent.values = @"CEA < 26 means ur dead";
    labTestEvent.interpretation = @"you still got cancer";
    
    return labTestEvent;
}

@end

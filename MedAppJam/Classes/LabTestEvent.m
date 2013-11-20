//
//  LabTestEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "LabTestEvent.h"

@implementation LabTestEvent

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        self.eventType = [[decoder decodeObjectForKey:@"eventType"] integerValue];
        self.dateTime = [decoder decodeObjectForKey:@"dateTime"];
        self.procedureName = [decoder decodeObjectForKey:@"procedureName"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.information = [decoder decodeObjectForKey:@"information"];
        self.howTested = [decoder decodeObjectForKey:@"howTested"];
        self.values = [decoder decodeObjectForKey:@"values"];
        self.interpretation = [decoder decodeObjectForKey:@"interpretation"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.eventType] forKey:@"eventType"];
    [encoder encodeObject:self.dateTime forKey:@"dateTime"];
    [encoder encodeObject:self.procedureName forKey:@"procedureName"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.information forKey:@"information"];
    [encoder encodeObject:self.howTested forKey:@"howTested"];
    [encoder encodeObject:self.values forKey:@"values"];
    [encoder encodeObject:self.interpretation forKey:@"interpretation"];
}

+ (LabTestEvent *)sampleEvent {
    LabTestEvent *labTestEvent = [[LabTestEvent alloc] init];
    
    labTestEvent.eventType = EventTypeLabTest;
    labTestEvent.procedureName = @"Carcinoembryonic Antigen (CEA)";
    labTestEvent.location = @"Quest Diagnostics\n4050 Barranca Pkwy.\nIrvine, CA 92604";
    labTestEvent.dateTime = [NSDate date];
    labTestEvent.information = @"The carcinoembryonic antigen (CEA) test measures the amount of this protein that may appear in the blood of some people who have certain kinds of cancers, especially large intestine (colon and rectal) cancer. It may also be present in people with cancer of the pancreas, breast, ovary, or lung.";
    labTestEvent.howTested = @"The health professional taking a sample of your blood will:\n\nWrap an elastic band around your upper arm to stop the flow of blood. This makes the veins below the band larger so it is easier to put a needle into the vein.\n\nClean the needle site with alcohol.\n\nPut the needle into the vein. More than one needle stick may be needed.\n\nAttach a tube to the needle to fill it with blood.\n\nRemove the band from your arm when enough blood is collected.\n\nPut a gauze pad or cotton ball over the needle site as the needle is removed.\n\nPut pressure to the site and then put on a bandage.";
    labTestEvent.values = @"Normal: Less than 5 nanograms per milliliter\n\nMany conditions can change your CEA levels. Your doctor will discuss any significant abnormal results with you in relation to your symptoms and medical history.";
    labTestEvent.interpretation = @"High values of CEA can indicate:\n\nCancer of the colon, lung, pancreas, breast, or ovary may be present.\n\nCancer may not be responding to treatment.\n\nCancer may have returned after treatment. A steadily rising CEA may be the first sign that cancer has come back after treatment. Also, people with advanced cancer or cancer that has spread to other parts of the body (metastatic cancer) may have high CEA levels if their original cancer produced this protein before treatment.\n\nAnother condition or disease is present, such as cirrhosis, hepatitis, diverticulitis, inflammatory bowel disease, peptic ulcer disease, chronic obstructive pulmonary disease (COPD), inflammation of the gallbladder (cholecystitis), or an obstructed bile duct.";
    
    return labTestEvent;
}

@end

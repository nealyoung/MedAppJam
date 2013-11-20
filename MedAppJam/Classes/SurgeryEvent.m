//
//  SurgeryEvent.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "SurgeryEvent.h"

@implementation SurgeryEvent

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        self.eventType = [[decoder decodeObjectForKey:@"eventType"] integerValue];
        self.dateTime = [decoder decodeObjectForKey:@"dateTime"];
        self.procedureName = [decoder decodeObjectForKey:@"procedureName"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.information = [decoder decodeObjectForKey:@"information"];
        self.preparation = [decoder decodeObjectForKey:@"preparation"];
        self.recovery = [decoder decodeObjectForKey:@"recovery"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.eventType] forKey:@"eventType"];
    [encoder encodeObject:self.dateTime forKey:@"dateTime"];
    [encoder encodeObject:self.procedureName forKey:@"procedureName"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.information forKey:@"information"];
    [encoder encodeObject:self.preparation forKey:@"preparation"];
    [encoder encodeObject:self.recovery forKey:@"recovery"];
}

+ (SurgeryEvent *)sampleEvent {
    SurgeryEvent *surgeryEvent = [[SurgeryEvent alloc] init];
    
    surgeryEvent.eventType = EventTypeSurgery;
    surgeryEvent.procedureName = @"Pneumonectomy";
    surgeryEvent.location = @"UCI Medical Center\n101 The City Dr. South\nOrange, CA 92868";
    surgeryEvent.dateTime = [NSDate dateWithTimeInterval:2000000 sinceDate:[NSDate date]];
    surgeryEvent.information = @"With a standard pneumonectomy, either the right lung (which contains 3 lobes) or the left lung (containing 2 lobes) is removed.  A pneumonectomy is most commonly done as a treatment for non-small cell lung cancer, when a less invasive procedure, such as a lobectomy, cannot remove the entire tumor. This may occur if the tumor is large, if it has spread beyond a single lobe, or if it is located in the central area of the lungs.  Because a pneumonectomy involves the removal of an entire lung, the procedure is usually reserved for those people who have adequate lung function and will be able to tolerate living with only one lung. That said, many people have gone on to live active lives following a pneumonectomy.";
    surgeryEvent.preparation = @"The night before surgery, your doctor will recommend that you “fast” – that is, not eat or drink anything (even water) for at least 8 hours.  On the morning of your surgery, a nurse will ask you several questions and place an IV (intravenous line) in your arm. She will also fit you with monitors so that your blood pressure, heart rate, and oxygen levels can be monitored throughout surgery. Your surgeon will visit to again discuss the procedure and ask you to sign a consent form. The anesthesiologist will also visit to talk about the anesthesia you will be given, and ask about any problems you or your family members have experienced with anesthesia in the past. The operating room staff will guide your family to a waiting area, where the surgical staff can keep them updated on your progress and speak with them when your surgery is done.";
    surgeryEvent.recovery = @"When your surgery is complete, you will be taken to the recovery room where you will monitored closely for several hours. In some cases, you may be taken directly to the intensive care unit (ICU). Following recovery, most people spend the first several days in the ICU. For the first day, your breathing may be assisted with a ventilator. Since this can cause some anxiety, you will be given medications that keep you very drowsy until the tube is removed.  When the ventilator is removed and you become less sleepy, a respiratory therapist will ask you to cough, and will assist you in the use of an incentive spirometer. This is a device that you breathe into in order to exercise your lungs, and to help keep the small air sacs in your lungs open.  When you are able, the nursing staff will help you sit, and then encourage you to get up and walk with assistance. You may not feel like being active, but increasing your activity will help you regain your strength more quickly, and reduces the risk of developing blood clots. Most people spend at least 6 to 10 days in the hospital following surgery.  Some people return to work after 8 weeks, but your doctor will give you special restrictions, such as avoiding any heavy lifting. It will also take time for your remaining lung to take over, and shortness of breath may persist for several months following surgery.";
    
    return surgeryEvent;
}

@end

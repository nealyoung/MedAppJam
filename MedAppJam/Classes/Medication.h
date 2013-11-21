//
//  Medication.h
//  MedAppJam
//
//  Created by Nealon Young on 11/21/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medication : NSObject <NSCoding>

@property NSString *name;
@property NSString *dosage;
@property NSString *notes;

@end

//
//  NewMedicationViewController.h
//  MedAppJam
//
//  Created by Nealon Young on 11/21/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medication.h"

@class NewMedicationViewController;

@protocol NewMedicationViewControllerDelegate

- (void)newMedicationViewController:(NewMedicationViewController *)viewController didCreateMedication:(Medication *)medication;

@end

@interface NewMedicationViewController : UITableViewController

@property (nonatomic, weak) id <NewMedicationViewControllerDelegate> delegate;

@end


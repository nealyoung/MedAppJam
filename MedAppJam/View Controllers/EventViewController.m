//
//  EventViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/12/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "EventViewController.h"

#import "AppointmentCell.h"
#import "ChemoEvent.h"
#import "InformationCell.h"
#import "LabTestEvent.h"
#import "SurgeryEvent.h"
#import "UIFont+Application.h"

@interface EventViewController ()

+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (AppointmentCell *)appointmentCellForTableView:(UITableView *)tableView;
- (InformationCell *)informationCellForTableView:(UITableView *)tableView;

@end

@implementation EventViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 0.0f);
        self.tableView.backgroundColor = [UIColor colorWithRed:0xF7/255.0f green:0xF7/255.0f blue:0xF7/255.0f alpha:1.0f];
    }
    
    return self;
}

- (id)initWithEvent:(Event *)event {
    self = [self initWithStyle:UITableViewStylePlain];
    
    if (self) {
        self.event = event;
        
        if (self.event.eventType == EventTypeChemo) {
            self.navigationItem.title = @"Chemotherapy";
        } else if (self.event.eventType == EventTypeLabTest) {
            self.navigationItem.title = @"Lab Test";
        } else if (self.event.eventType == EventTypeSurgery) {
            self.navigationItem.title = @"Surgery";
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppointmentCell *)appointmentCellForTableView:(UITableView *)tableView {
    static NSString *AppointmentCellIdentifier = @"AppointmentCell";
    AppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:AppointmentCellIdentifier];
    
    if (cell == nil) {
        cell = [[AppointmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AppointmentCellIdentifier];
    }
    
    return cell;
}

- (InformationCell *)informationCellForTableView:(UITableView *)tableView {
    static NSString *InformationCellIdentifier = @"InformationCell";
    InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:InformationCellIdentifier];
    
    if (cell == nil) {
        cell = [[InformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InformationCellIdentifier];
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.event.eventType == EventTypeChemo) {
        return 4;
    } else if (self.event.eventType == EventTypeLabTest) {
        return 5;
    } else if (self.event.eventType == EventTypeSurgery) {
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.event.eventType == EventTypeChemo) {
        /*
         Cell 0: Appointment
         Cell 1: Mechanism
         Cell 2: Timeline
         Cell 3: Side effects
         */
        
        ChemoEvent *chemoEvent = (ChemoEvent *)self.event;

        if (indexPath.row == 0) {
            AppointmentCell *cell = [self appointmentCellForTableView:tableView];
            cell.iconImageView.image = [UIImage imageNamed:@"chemo_icon.png"];
            cell.procedureNameLabel.text = self.event.procedureName;
            cell.locationLabel.text = self.event.location;
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy, h:mm a"];
            cell.timeLabel.text = [dateFormatter stringFromDate:self.event.dateTime];
            
            return cell;
        } else {
            InformationCell *cell = [self informationCellForTableView:tableView];
            
            if (indexPath.row == 1) {
                cell.titleLabel.text = @"Mechanism";
                cell.informationLabel.text = chemoEvent.mechanism;
            } else if (indexPath.row == 2) {
                cell.titleLabel.text = @"Timeline";
                cell.informationLabel.text = chemoEvent.timeline;
            } else if (indexPath.row == 3) {
                cell.titleLabel.text = @"Side Effects";
                cell.informationLabel.text = chemoEvent.sideEffects;
            }
            
            return cell;
        }
    } else if (self.event.eventType == EventTypeLabTest) {
        /*
         Row 0: Appointment
         Row 1: Information
         Row 2: How Tested
         Row 3: Values
         Row 4: Interpretation
         */

        LabTestEvent *labTestEvent = (LabTestEvent *)self.event;
        
        if (indexPath.row == 0) {
            AppointmentCell *cell = [self appointmentCellForTableView:tableView];
            cell.iconImageView.image = [UIImage imageNamed:@"lab_test_icon.png"];
            cell.procedureNameLabel.text = self.event.procedureName;
            cell.locationLabel.text = self.event.location;
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy, h:mm a"];
            cell.timeLabel.text = [dateFormatter stringFromDate:self.event.dateTime];
            
            return cell;
        } else {
            InformationCell *cell = [self informationCellForTableView:tableView];
            
            if (indexPath.row == 1) {
                cell.titleLabel.text = @"Information";
                cell.informationLabel.text = labTestEvent.information;
            } else if (indexPath.row == 2) {
                cell.titleLabel.text = @"How it's Tested";
                cell.informationLabel.text = labTestEvent.howTested;
            } else if (indexPath.row == 3) {
                cell.titleLabel.text = @"Values";
                cell.informationLabel.text = labTestEvent.values;
            } else if (indexPath.row == 4) {
                cell.titleLabel.text = @"Interpretation";
                cell.informationLabel.text = labTestEvent.interpretation;
            }
            
            return cell;
        }
    } else if (self.event.eventType == EventTypeSurgery) {
        /*
         Row 0: Appointment
         Row 1: Information
         Row 2: Preparation
         Row 3: Recovery
        */
        
        SurgeryEvent *surgeryEvent = (SurgeryEvent *)self.event;
        
        if (indexPath.row == 0) {
            AppointmentCell *cell = [self appointmentCellForTableView:tableView];
            cell.iconImageView.image = [UIImage imageNamed:@"surgery_icon.png"];
            cell.procedureNameLabel.text = self.event.procedureName;
            cell.locationLabel.text = self.event.location;
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/d/yyyy, h:mm a"];
            cell.timeLabel.text = [dateFormatter stringFromDate:self.event.dateTime];
            
            return cell;
        } else {
            InformationCell *cell = [self informationCellForTableView:tableView];

            if (indexPath.row == 1) {
                cell.titleLabel.text = @"Information";
                cell.informationLabel.text = surgeryEvent.information;
            } else if (indexPath.row == 2) {
                cell.titleLabel.text = @"Preparation";
                cell.informationLabel.text = surgeryEvent.preparation;
            } else if (indexPath.row == 3) {
                cell.titleLabel.text = @"Recovery";
                cell.informationLabel.text = surgeryEvent.recovery;
            }
            
            return cell;
        }
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.event.eventType == EventTypeChemo) {
        ChemoEvent *chemoEvent= (ChemoEvent *)self.event;
        NSString *informationString;
        
        if (indexPath.row == 0) {
            return 110.0f;
        } else if (indexPath.row == 1) {
            informationString = chemoEvent.mechanism;
        } else if (indexPath.row == 2) {
            informationString = chemoEvent.timeline;
        } else if (indexPath.row == 3) {
            informationString = chemoEvent.sideEffects;
        }
        
        CGSize sizeToFit = [EventViewController sizeOfString:informationString
                                                    withFont:[UIFont applicationFontOfSize:14.0f]
                                          constrainedToWidth:300.0f];
        
        return 25.0f + sizeToFit.height + 10.0f;
    } else if (self.event.eventType == EventTypeLabTest) {
        LabTestEvent *labTestEvent = (LabTestEvent *)self.event;
        NSString *informationString;
        
        if (indexPath.row == 0) {
            return 110.0f;
        } else if (indexPath.row == 1) {
            informationString = labTestEvent.information;
        } else if (indexPath.row == 2) {
            informationString = labTestEvent.howTested;
        } else if (indexPath.row == 3) {
            informationString = labTestEvent.values;
        } else if (indexPath.row == 4) {
            informationString = labTestEvent.interpretation;
        }
        
        CGSize sizeToFit = [EventViewController sizeOfString:informationString
                                                    withFont:[UIFont applicationFontOfSize:14.0f]
                                          constrainedToWidth:300.0f];
        
        return 25.0f + sizeToFit.height + 10.0f;
    } else if (self.event.eventType == EventTypeSurgery) {
        SurgeryEvent *surgeryEvent = (SurgeryEvent *)self.event;
        NSString *informationString;
        
        if (indexPath.row == 0) {
            return 110.0f;
        } else if (indexPath.row == 1) {
            informationString = surgeryEvent.information;
        } else if (indexPath.row == 2) {
            informationString = surgeryEvent.preparation;
        } else if (indexPath.row == 3) {
            informationString = surgeryEvent.recovery;
        }
        
        CGSize sizeToFit = [EventViewController sizeOfString:informationString
                                                    withFont:[UIFont applicationFontOfSize:14.0f]
                                          constrainedToWidth:300.0f];
        
        return 25.0f + sizeToFit.height + 10.0f;
    }
    
    return 0.0f;
}

+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize sizeToFit = [string sizeWithFont:font
                          constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                              lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    
    return sizeToFit;
}

@end

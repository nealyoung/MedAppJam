//
//  EventsViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/8/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "EventsViewController.h"

#import "CodeReaderViewController.h"
#import "ChemoEvent.h"
#import "Event.h"
#import "EventCell.h"
#import "EventViewController.h"
#import "LabTestEvent.h"
#import "SurgeryEvent.h"
#import "SORelativeDateTransformer.h"
#import "SVProgressHUD.h"

@interface EventsViewController ()

@property NSMutableArray *events;

- (void)addEvent;

@end

@implementation EventsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        //self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Treatments" image:[UIImage imageNamed:@"Drawer.png"] tag:0];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];

        NSData *eventsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"events"];
        
        if (eventsData == nil) {
            NSArray *sampleEvents = @[[LabTestEvent sampleEvent], [ChemoEvent sampleEvent], [SurgeryEvent sampleEvent]];
            self.events = [sampleEvents mutableCopy];
            
            eventsData = [NSKeyedArchiver archivedDataWithRootObject:self.events];
            [[NSUserDefaults standardUserDefaults] setObject:eventsData forKey:@"events"];
        } else {
            NSArray *events = [NSKeyedUnarchiver unarchiveObjectWithData:eventsData];
            self.events = [events mutableCopy];
        }
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 70.0f, 0.0f, 0.0f);
        self.tableView.backgroundColor = [UIColor colorWithRed:0xF7/255.0f green:0xF7/255.0f blue:0xF7/255.0f alpha:1.0f];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Treatment Plan";
    
    UIBarButtonItem *addEventButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEvent)];
    self.navigationItem.rightBarButtonItem = addEventButton;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addEvent {
    CodeReaderViewController *codeReaderViewController = [[CodeReaderViewController alloc] init];
    codeReaderViewController.readerView.readerDelegate = self;
    
    [self presentViewController:codeReaderViewController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[EventCell alloc] init];
    }
    
    Event *event = self.events[indexPath.row];
    
    if (event.eventType == EventTypeChemo) {
        cell.eventTypeLabel.text = @"Chemotherapy";
        cell.iconImageView.image = [UIImage imageNamed:@"chemo_icon.png"];
    } else if (event.eventType == EventTypeLabTest) {
        cell.eventTypeLabel.text = @"Lab Test";
        cell.iconImageView.image = [UIImage imageNamed:@"lab_test_icon.png"];
    } else if (event.eventType == EventTypeSurgery) {
        cell.eventTypeLabel.text = @"Surgery";
        cell.iconImageView.image = [UIImage imageNamed:@"surgery_icon.png"];
    }
    
    cell.procedureNameLabel.text = event.procedureName;
    
    // We need to get the first line of the address to display on the main page
    NSRange firstLineRange = [event.location rangeOfString:@"\n"];
    
    if (firstLineRange.location != NSNotFound) {
        cell.locationLabel.text = [event.location substringToIndex:firstLineRange.location];
    } else {
        cell.locationLabel.text = event.location;
    }
    
    SORelativeDateTransformer *dateTransformer = [[SORelativeDateTransformer alloc] init];
    cell.timeLabel.text = [dateTransformer transformedValue:event.dateTime];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EventViewController *eventViewController = [[EventViewController alloc] initWithEvent:self.events[indexPath.row]];
    [self.navigationController pushViewController:eventViewController animated:YES];
}

#pragma mark - ZBarReaderViewDelegate

/*
 Format for QR code is:
 
 {
    "EventType" : Integer EventType value,
    "Date" : Date and time of appointment, in a string formatted with NSDateFormatterLongStyle
    "Location" : "Medical Clinic\n123 Main St.\nIrvine, CA 92617"
    "TreatmentID" : Integer index to array of treatments for specified event type
 }
 */
- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image {
    NSData *json;
    
    for (ZBarSymbol *symbol in symbols) {
        json = [symbol.data dataUsingEncoding:NSUTF8StringEncoding];
        break;
    }
    
    NSString *treatmentDataPath = [[NSBundle mainBundle] pathForResource:@"TreatmentData" ofType:@"plist"];
    NSDictionary *treatmentData = [[NSDictionary alloc] initWithContentsOfFile:treatmentDataPath];
    
    NSError *error;
    
    NSDictionary *eventData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        [SVProgressHUD showErrorWithStatus:@"Error reading code"];
        
        return;
    }
    
    EventType eventType = [eventData[@"EventType"] integerValue];
    NSNumber *treatmentID = eventData[@"TreatmentID"];

    NSLog(@"%@", eventData);

    Event *event;
    
    if (eventType == EventTypeChemo) {
        ChemoEvent *chemoEvent = [[ChemoEvent alloc] init];
        
        NSArray *treatments = treatmentData[@"Chemotherapy"];
        NSDictionary *treatment = treatments[[treatmentID integerValue]];
        chemoEvent.eventType = EventTypeChemo;
        chemoEvent.procedureName = treatment[@"ProcedureName"];
        chemoEvent.timeline = treatment[@"Timeline"];
        chemoEvent.mechanism = treatment[@"Mechanism"];
        chemoEvent.sideEffects = treatment[@"SideEffects"];
        
        event = chemoEvent;
    } else if (eventType == EventTypeLabTest) {
        LabTestEvent *labTestEvent = [[LabTestEvent alloc] init];
        
        NSArray *treatments = treatmentData[@"Lab Test"];
        NSDictionary *treatment = treatments[[treatmentID integerValue]];
        labTestEvent.eventType = EventTypeLabTest;
        labTestEvent.procedureName = treatment[@"ProcedureName"];
        labTestEvent.information = treatment[@"Information"];
        labTestEvent.howTested = treatment[@"HowTested"];
        labTestEvent.values = treatment[@"Values"];
        labTestEvent.interpretation = treatment[@"Interpretation"];
        
        event = labTestEvent;
    } else if (eventType == EventTypeSurgery) {
        SurgeryEvent *surgeryEvent = [[SurgeryEvent alloc] init];
        
        NSArray *treatments = treatmentData[@"Surgery"];
        NSDictionary *treatment = treatments[[treatmentID integerValue]];
        surgeryEvent.eventType = EventTypeSurgery;
        surgeryEvent.procedureName = treatment[@"ProcedureName"];
        surgeryEvent.information = treatment[@"Information"];
        surgeryEvent.preparation = treatment[@"Preparation"];
        surgeryEvent.recovery = treatment[@"Recovery"];
        
        event = surgeryEvent;
    }
    
    event.location = eventData[@"Location"];
    NSLog(@"%@", eventData[@"Location"]);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
    event.dateTime = [dateFormatter dateFromString:eventData[@"Date"]];
    
    // Add the newly created event to the list
    [self.events addObject:event];
    
    // Save the event so it is persisted on future app launches
    NSData *eventsData = [NSKeyedArchiver archivedDataWithRootObject:self.events];
    [[NSUserDefaults standardUserDefaults] setObject:eventsData forKey:@"events"];
    
    // Reload the data in the table view so the new event is visible
    [self.tableView reloadData];
    
    [SVProgressHUD showSuccessWithStatus:@"Appointment added"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end

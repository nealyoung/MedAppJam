//
//  MedicationsViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/20/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "MedicationsViewController.h"

#import "Medication.h"
#import "UIFont+Application.h"

@interface MedicationsViewController ()

@property NSMutableArray *medications;

- (void)addMedication;

@end

@implementation MedicationsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Medications" image:[UIImage imageNamed:@"pill_icon.png"] tag:2];
        self.navigationItem.title = @"My Medications";
        self.tableView.backgroundColor = [UIColor colorWithRed:0xF7/255.0f green:0xF7/255.0f blue:0xF7/255.0f alpha:1.0f];
        
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMedication)];
        self.navigationItem.rightBarButtonItem = barButtonItem;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        NSData *medicationsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"medications"];
        
        if (medicationsData == nil) {
            self.medications = [NSMutableArray array];
        } else {
            NSArray *medications = [NSKeyedUnarchiver unarchiveObjectWithData:medicationsData];
            self.medications = [medications mutableCopy];
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMedication {
    NewMedicationViewController *newMedicationViewController = [[NewMedicationViewController alloc] initWithStyle:UITableViewStyleGrouped];
    newMedicationViewController.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newMedicationViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - NewMedicationViewControllerDelegate

- (void)newMedicationViewController:(NewMedicationViewController *)viewController didCreateMedication:(Medication *)medication {
    [self.medications addObject:medication];
    
    // Save the medication so it is persisted on future app launches
    NSData *medicationsData = [NSKeyedArchiver archivedDataWithRootObject:self.medications];
    [[NSUserDefaults standardUserDefaults] setObject:medicationsData forKey:@"medications"];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.medications count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont mediumApplicationFontOfSize:16.0f];
        cell.detailTextLabel.font = [UIFont applicationFontOfSize:14.0f];
        cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    }
    
    Medication *medication = self.medications[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ · %@", medication.name, medication.dosage];
    cell.detailTextLabel.text = medication.notes;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove the deleted event from the array, and save the changes
        [self.medications removeObjectAtIndex:indexPath.row];
        NSData *medicationsData = [NSKeyedArchiver archivedDataWithRootObject:self.medications];
        [[NSUserDefaults standardUserDefaults] setObject:medicationsData forKey:@"medications"];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end

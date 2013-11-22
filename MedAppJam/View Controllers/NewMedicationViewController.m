//
//  NewMedicationViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/21/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "NewMedicationViewController.h"

#import "Medication.h"
#import "SVProgressHUD.h"
#import "TextFieldCell.h"

@interface NewMedicationViewController ()

- (void)create;
- (void)cancel;

@end

@implementation NewMedicationViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.tableView.backgroundColor = [UIColor colorWithRed:0xF7/255.0f green:0xF7/255.0f blue:0xF7/255.0f alpha:1.0f];

        //self.tableView.backgroundColor = [UIColor darkGrayColor];
        UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(create)];
        UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
        self.navigationItem.rightBarButtonItem = doneButtonItem;
        self.navigationItem.leftBarButtonItem = cancelButtonItem;
        self.navigationItem.title = @"New Medication";
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

- (void)create {
    TextFieldCell *nameCell = (TextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    TextFieldCell *dosageCell = (TextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    TextFieldCell *notesCell = (TextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    
    Medication *medication = [[Medication alloc] init];
    medication.name = nameCell.textField.text;
    medication.dosage = dosageCell.textField.text;
    medication.notes = notesCell.textField.text;
    
    [self.delegate newMedicationViewController:self didCreateMedication:medication];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.label.text = @"String";
    }
    
    if (indexPath.row == 0) {
        cell.label.text = @"Name";
        cell.textField.placeholder = @"Tarceva";
    } else if (indexPath.row == 1) {
        cell.label.text = @"Dosage";
        cell.textField.placeholder = @"150mg";
    } else if (indexPath.row == 2) {
        cell.label.text = @"Notes";
        cell.textField.placeholder = @"Take daily before bed";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end

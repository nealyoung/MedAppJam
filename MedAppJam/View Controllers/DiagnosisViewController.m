//
//  DiagnosisViewController.m
//  MedAppJam
//
//  Created by Nealon Young on 11/20/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "DiagnosisViewController.h"

#import "InformationCell.h"
#import "UIFont+Application.h"

@interface DiagnosisViewController ()

@property NSInteger diagnosisIndex;
@property NSArray *cancers;

- (void)selectDiagnosis;
- (void)dismissDiagnosisViewController;

@end

@implementation DiagnosisViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Diagnosis" image:[UIImage imageNamed:@"stethoscope_icon.png"] tag:1];
        
        NSString *cancerDataPath = [[NSBundle mainBundle] pathForResource:@"CancerData" ofType:@"plist"];
        self.cancers = [[NSArray alloc] initWithContentsOfFile:cancerDataPath];
        
        self.diagnosisIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"diagnosisIndex"];
        
        UIBarButtonItem *selectDiagnosisButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(selectDiagnosis)];
        self.navigationItem.rightBarButtonItem = selectDiagnosisButton;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *cancer = self.cancers[self.diagnosisIndex];
    self.navigationItem.title = cancer[@"Name"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectDiagnosis {
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.dataSource = self;
    tableViewController.tableView.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    tableViewController.navigationItem.title = @"Select Diagnosis";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissDiagnosisViewController)];
    tableViewController.navigationItem.leftBarButtonItem = cancelButton;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)dismissDiagnosisViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        return 3;
    } else {
        return [self.cancers count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    static NSString *InformationCellIdentifier = @"InformationCell";
    
    if (tableView == self.tableView) {
        InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:InformationCellIdentifier];
        NSDictionary *cancer = self.cancers[self.diagnosisIndex];

        if (cell == nil) {
            cell = [[InformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InformationCellIdentifier];
        }
        
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"Information";
            cell.informationLabel.text = cancer[@"Information"];
        } else if (indexPath.row == 1) {
            cell.titleLabel.text = @"Causes";
            cell.informationLabel.text = cancer[@"Causes"];
        } else if (indexPath.row == 2) {
            cell.titleLabel.text = @"Treatment";
            cell.informationLabel.text = cancer[@"Treatment"];
        }
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.font = [UIFont mediumApplicationFontOfSize:19.0f];
        }
        
        NSDictionary *cancer = self.cancers[indexPath.row];
        cell.textLabel.text = cancer[@"Name"];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView) {
        NSDictionary *cancer = self.cancers[self.diagnosisIndex];
        NSString *informationString;
        
        if (indexPath.row == 0) {
            informationString = cancer[@"Information"];
        } else if (indexPath.row == 1) {
            informationString = cancer[@"Causes"];
        } else if (indexPath.row == 2) {
            informationString = cancer[@"Treatment"];
        }
        
        return [InformationCell heightWithString:informationString font:[UIFont applicationFontOfSize:14.0f]];
    } else {
        return 44.0f;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"diagnosisIndex"];
    self.diagnosisIndex = indexPath.row;
    NSDictionary *cancer = self.cancers[self.diagnosisIndex];
    self.navigationItem.title = cancer[@"Name"];
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

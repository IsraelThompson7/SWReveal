//
//  RearTableViewController.m
//  SWReveal
//
//  Created by scott mehus on 6/22/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "RearTableViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "MyGradeViewController.h"
#import "DesiredGradeViewController.h"
#import "PrioritiesViewController.h"
#import "TwitterViewController.h"
#import "AboutViewController.h"

@interface RearTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation RearTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor darkGrayColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 88;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.textColor = [UIColor lightGrayColor];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"My Grade";
            break;
            
            case 1:
            cell.textLabel.text = @"Desired Grade";
            break;
            
            case 2:
            cell.textLabel.text = @"Priorities";
            break;
            
            case 3:
            cell.textLabel.text = @"Twitter";
            break;
            
            case 4:
            cell.textLabel.text = @"About";
            break;
            
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"SELECTED ROW: %d", indexPath.row);
    
    SWRevealViewController *revealController = self.revealViewController;   
    UIViewController *frontNavigationController = (id)revealController.frontViewController;
    
    if (indexPath.row == 0) {
        
        if (![frontNavigationController isKindOfClass:[MyGradeViewController class]]) {
            
            
            MyGradeViewController *MyGradeView = [[MyGradeViewController alloc] init];
            
             UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:MyGradeView];
             
            [revealController setFrontViewController:navigationController animated:YES];
            
        } else {
            [revealController revealToggle:self];
        }
        
    } else if (indexPath.row == 1) {
        
        if (![frontNavigationController isKindOfClass:[DesiredGradeViewController class]]) {
            
            DesiredGradeViewController *desiredGradeView = [[DesiredGradeViewController alloc] init];
            [revealController setFrontViewController:desiredGradeView animated:YES];
            
        } else {
            [revealController revealToggle:self];
        }
    } else if (indexPath.row == 2) {
        
        if (![frontNavigationController isKindOfClass:[PrioritiesViewController class]]) {
            
            PrioritiesViewController *prioritiesView = [[PrioritiesViewController alloc] init];
            [revealController setFrontViewController:prioritiesView animated:YES];
        } else {
            [revealController revealToggle:self];
        }
    } else if (indexPath.row == 3) {
        
        if (![frontNavigationController isKindOfClass:[TwitterViewController class]]) {
            
            TwitterViewController *twitterView = [[TwitterViewController alloc] init];
            [revealController setFrontViewController:twitterView animated:YES];
            
        } else {
            [revealController revealToggle:self];
        }
    } else if (indexPath.row == 4) {
        
        if (![frontNavigationController isKindOfClass:[AboutViewController class]]) {
            
            AboutViewController *aboutView = [[AboutViewController alloc] init];
            [revealController setFrontViewController:aboutView animated:YES];
        } else {
            [revealController revealToggle:self];
        }
    }
}

@end

//
//  ReasonViewController.m
//  SWReveal
//
//  Created by scott mehus on 7/1/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "ReasonViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomCellBackground.h"
#import "GradientView.h"

@interface ReasonViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ReasonViewController {
    
    GradientView *gradientView;
}

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
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 50, 300, 350) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.layer.borderWidth = 3.0f;
    self.tableView.alpha = 0.75;
    self.tableView.layer.borderColor = [UIColor blackColor].CGColor;
    self.tableView.layer.cornerRadius = 10.0f;
    //self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
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
    
    return [self.reasonsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.font = [UIFont fontWithName:@"Times New Roman" size:15.0f];
    cell.backgroundView = [[CustomCellBackground alloc] init];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = self.reasonsArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate reasonsViewController:self didSelectReason:self.reasonsArray[indexPath.row]];
    
    [self closeScreen];
    
}

- (void)closeScreen {
    
    [self dismissFromParentViewController];

}

- (void)dismissFromParentViewController {
    
    self.view.alpha = 1.0;
    gradientView.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        [self willMoveToParentViewController:nil];
        self.view.alpha = 0.0;
        gradientView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self.view removeFromSuperview];
        [gradientView removeFromSuperview];
        [self removeFromParentViewController];
        
    }];
}

- (void)presentInParentViewController:(UIViewController *)parentViewController {
    
    gradientView = [[GradientView alloc] initWithFrame:parentViewController.view.bounds];
    [parentViewController.view addSubview:gradientView];
    gradientView.alpha = 0.0;
    
    [UIView animateWithDuration:0.1 animations:^{
        gradientView.alpha = 1.0;
        
    }];
    

    
    [parentViewController.view addSubview:self.view];
    [parentViewController addChildViewController:self];
    [self didMoveToParentViewController:parentViewController];
    
    
    
    
    
}


- (void)dealloc {
    
    
}













@end

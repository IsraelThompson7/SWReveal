//
//  FinalGradeViewController.m
//  SWReveal
//
//  Created by scott mehus on 6/26/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "FinalGradeViewController.h"
#import "SWRevealViewController.h"

@interface FinalGradeViewController ()

@end

@implementation FinalGradeViewController

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
    
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

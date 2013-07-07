//
//  FrontViewController.m
//  SWReveal
//
//  Created by scott mehus on 6/22/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "OpeningViewController.h"
#import "SWRevealViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MyGradeViewController.h"



@interface OpeningViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end

@implementation OpeningViewController

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
    
    //self.view.backgroundColor = [UIColor greenColor];
    
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    

    
    self.scrollView.contentSize = CGSizeMake(1600, 420);
    self.pageControl.numberOfPages = 5;
    
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    welcomeLabel.textColor = [UIColor darkGrayColor];
    welcomeLabel.font = [UIFont fontWithName:@"Times New Roman" size:17.0f];
    welcomeLabel.text = @"Welcome to";
    
    UILabel *lifeGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 250, 50)];
    lifeGradeLabel.textColor = [UIColor darkGrayColor];
    lifeGradeLabel.font = [UIFont fontWithName:@"Times New Roman" size:36.0f];
    lifeGradeLabel.text = @"Life Grade";
    
    UILabel *stepOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(340, 50, 100, 50)];
    stepOneLabel.textColor = [UIColor darkGrayColor];
    stepOneLabel.font = [UIFont fontWithName:@"Times New Roman" size:17.0f];
    stepOneLabel.text = @"Step One";
    
    UILabel *stepTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(680.0, 50, 100, 50)];
    stepTwoLabel.textColor = [UIColor darkGrayColor];
    stepTwoLabel.font = [UIFont fontWithName:@"Times New Roman" size:17.0f];
    stepTwoLabel.text = @"Step Two";
    
    UILabel *stepThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(1000, 50, 100, 50)];
    stepThreeLabel.textColor = [UIColor darkGrayColor];
    stepThreeLabel.font = [UIFont fontWithName:@"Times New Roman" size:17.0f];
    stepThreeLabel.text = @"Step Three";
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(1450, 100, 100, 50)];
    [startButton addTarget:self action:@selector(startButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor greenColor];
    [startButton setTitle:@"Start Grading" forState:UIControlStateNormal];
    
    
    
    
  
    
    [self.scrollView addSubview:welcomeLabel];
    [self.scrollView addSubview:lifeGradeLabel];
    [self.scrollView addSubview:stepOneLabel];
    [self.scrollView addSubview:stepTwoLabel];
    [self.scrollView addSubview:stepThreeLabel];
    [self.scrollView addSubview:startButton];
    
   /*
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 250, 300)];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    firstView.layer.borderWidth = 1.0f;
    firstView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    firstView.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    firstView.layer.shadowOpacity = 1.0f;
    */
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat width = self.scrollView.bounds.size.width;
    int currentPage = (self.scrollView.contentOffset.x + width/2.0) / width;
    self.pageControl.currentPage = currentPage;
}


- (void)startButtonPressed {
    
    SWRevealViewController *revealController = self.revealViewController;  
    MyGradeViewController *MyGradeView = [[MyGradeViewController alloc] init];
    MyGradeView.managedObjectContext = self.managedObjectContext;
    MyGradeView.testString = @"THIS TEST HAS WORKED";
    
    
    /*
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:MyGradeView];
     */
    [revealController setFrontViewController:MyGradeView animated:YES];
    
    
}












@end

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

@property (nonatomic, strong) IBOutlet UILabel *gradeLabel;

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
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Mailing List"
                                                        message:@"Would you like to join the You Time Coaching mailing list" delegate:self cancelButtonTitle:@"No!" otherButtonTitles:@"Yes!",
                              @"Yes & submit grade", nil];
    [alertView show];
    
    NSLog(@"FINAL GRADE %@", self.finalGrade);
    
    
    [self loadFinalGrade];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Mailing List"
                                                        message:@"Would you like to join the You Time Coaching mailing list" delegate:self cancelButtonTitle:@"No!" otherButtonTitles:@"Yes!",
                              @"Yes & submit grade", nil];
    [alertView show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"***CANCEL BUTTON***");
        
        
        
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            //[self.delegate FinalGradeViewControllerDidDismiss];
        }];
    } else if (buttonIndex == 1) {
        
        NSLog(@"***MAILING LIST BUTTON***");
        
        
        
        NSArray *recicpients = [[NSArray alloc] initWithObjects:@"mehus.scott@gmail.com", nil];
        
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setToRecipients:recicpients];
        [controller setSubject:@"Please add me to your mailing list!"];
        [controller setMessageBody:@"I would like to be added to your mailing list" isHTML:NO];
        //[self presentModalViewController:controller animated:YES];
        [self presentViewController:controller animated:YES completion:nil];
        
        
    } else {
        
        NSLog(@"***MAILING LIST BUTTON WITH GRADE***");
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            //[self.delegate FinalGradeViewControllerDidDismiss];
        }];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self dismissModalViewControllerAnimated:YES];
    //[self.delegate FinalGradeViewControllerDidDismiss];
}


- (void)loadFinalGrade {
    
    int grade = [self.finalGrade integerValue];
    
    
    if (grade > 50) {
        self.gradeLabel.text = @"A";
    } else if (grade < 50 && grade > 40) {
        self.gradeLabel.text = @"B";
    } else if (grade < 40 && grade > 30) {
        self.gradeLabel.text = @"C";
    } else if (grade < 30 && grade > 20) {
        self.gradeLabel.text = @"D";
    } else {
        self.gradeLabel.text = @"F!";
    }
    
    
}














@end

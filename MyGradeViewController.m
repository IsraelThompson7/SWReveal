//
//  SecondViewController.m
//  SWReveal
//
//  Created by scott mehus on 6/24/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "MyGradeViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FinalGradeViewController.h"
#import "ReasonViewController.h"
#import "Grade.h"

@interface MyGradeViewController () <UIScrollViewDelegate, UIScrollViewAccessibilityDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *btn;
@property (nonatomic, strong) NSNumber *finalGrade;

@end

@implementation MyGradeViewController {
    

    Grade *grade;
    NSArray *scoreArray;
    
    NSNumber *firstGrade;
    NSNumber *secondGrade;
    NSNumber *thirdGrade;
    NSNumber *fourthGrade;
    NSNumber *fifthGrade;
    NSNumber *sixthGrade;
    NSNumber *seventhGrade;
    NSNumber *eighthGrade;
    NSNumber *ninthGrade;
    NSNumber *tenthGrade;
    NSNumber *eleventhGrade;
    NSNumber *twelfthGrade;
    
    NSString *reasonOne;
    NSString *reasonTwo;
    NSString *reasonThree;
    NSString *reasonFour;
    NSString *reasonFive;
    NSString *reasonSix;
    NSString *reasonSeven;
    NSString *reasonEighth;
    NSString *reasonNine;
    NSString *reasonTen;
    NSString *reasonEleven;
    NSString *reasonTwelve;
    
    UISlider *firstSlider;
    UISlider *secondSlider;
    UISlider *thirdSlider;
    UISlider *fourthSlider;
    UISlider *fifthSlider;
    UISlider *sixthSlider;
    UISlider *seventhSlider;
    UISlider *eighthSlider;
    UISlider *ninthSlider;
    UISlider *tenthSlider;
    UISlider *eleventhSlider;
    UISlider *twelfthSlider;
    
    
    UILabel *firstGradeLabel;
    UILabel *secondGradeLabel;
    UILabel *thirdGradeLabel;
    UILabel *fourthGradeLabel;
    UILabel *fifthGradeLabel;
    UILabel *sixthGradeLabel;
    UILabel *seventhGradeLabel;
    UILabel *eighthGradeLabel;
    UILabel *ninthGradeLabel;
    UILabel *tenthGradeLabel;
    UILabel *eleventhGradeLabel;
    UILabel *twelfthGradeLabel;
    
    UILabel *firstReason;
    UILabel *secondReason;
    UILabel *thirdReason;
    UILabel *fourthReason;
    UILabel *fifthReason;
    UILabel *sixthReason;
    UILabel *seventhReason;
    UILabel *eighthReason;
    UILabel *ninthReason;
    UILabel *tenthReason;
    UILabel *eleventhReason;
    UILabel *twelfthReason;
    

    
    NSArray *reasonsArray;
    NSArray *reasonsArray2;
    NSArray *reasonsArray3;
    NSArray *reasonsArray4;
    NSArray *reasonsArray5;
    NSArray *reasonsArray6;
    NSArray *reasonsArray7;
    NSArray *reasonsArray8;
    NSArray *reasonsArray9;
    NSArray *reasonsArray10;
    NSArray *reasonsArray11;
    NSArray *reasonsArray12;
    
    UITapGestureRecognizer *tap;
    UITapGestureRecognizer *tap2;
    UITapGestureRecognizer *tap3;
    UITapGestureRecognizer *tap4;
    UITapGestureRecognizer *tap5;
    UITapGestureRecognizer *tap6;
    UITapGestureRecognizer *tap7;
    UITapGestureRecognizer *tap8;
    UITapGestureRecognizer *tap9;
    UITapGestureRecognizer *tap10;
    UITapGestureRecognizer *tap11;
    UITapGestureRecognizer *tap12;
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0f];
        label.textColor = [UIColor darkGrayColor];
        label.text = @"My Grade";
        label.textAlignment = NSTextAlignmentCenter;
        
        self.navigationItem.titleView = label;
    }
    return self;
}

- (void)performFetch {
    
    
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Grade" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSError *error;
        NSArray *foundObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (foundObjects == nil) {
            NSLog(@"FETCH REQUEST ERROR");
            return;
        }
        
       grade = [foundObjects lastObject];
    

    
}

- (void)loadIvars {
    
    
    firstGrade = grade.firstGrade;
    secondGrade = grade.secondGrade;
    thirdGrade = grade.thirdGrade;
    fourthGrade = grade.fourthGrade;
    fifthGrade = grade.fifthGrade;
    sixthGrade = grade.sixthGrade;
    seventhGrade = grade.seventhGrade;
    eighthGrade = grade.eighthGrade;
    ninthGrade = grade.ninthGrade;
    tenthGrade = grade.tenthGrade;
    eleventhGrade = grade.eleventhGrade;
    twelfthGrade = grade.twelfthGrade;
    
    reasonOne = grade.firstReason;
    reasonTwo = grade.secondReason;
    reasonThree = grade.thirdReason;
    reasonFour = grade.fourthReason;
    reasonFive = grade.fifthReason;
    reasonSix = grade.sixthReason;
    reasonSeven = grade.seventhReason;
    reasonEighth = grade.eighthReason;
    reasonNine = grade.ninthReason;
    reasonTen = grade.tenthReason;
    reasonEleven = grade.eleventhReason;
    reasonTwelve = grade.twelfthReason;
    
}

- (void)loadReasonArrays {
    
    
    reasonsArray = [[NSArray alloc] initWithObjects:@"Many of my friends are unhealthy to be around",
                    @"Some of my friends are genuine, supportive and trustworthy but some are unhealthy to be around",
                    @"I have genuine, supportive and trustworthy friends", nil];
    
    reasonsArray2 = [[NSArray alloc] initWithObjects:@"I have a happy and healthy relationship with my boyfriend/girlfriend/spouse", @"My relationship is not the healthies to be in right now", @"I am single and wish to find someone I deserve", @"I am unhappy with the men/women I meet and need to find someone better for me", @"The relationship I am in is unhealthy", nil];
    
    reasonsArray3 = [[NSArray alloc] initWithObjects:@"I am very happy with the amount of money I am currently making and have put away savings", @"I am making a good living financially but would like to make more money", @"I need to save more money", @"I need to make more money each month to pay bills, be less stressed, and have money to live", nil];
    
    reasonsArray4 = [[NSArray alloc] initWithObjects:@"I love the job I am currently at.", @"I am happy with my job but can't see myself doing this forever.", @"I do not enjoy and am not passionate about the work I currently do.", nil];
    
    reasonsArray5 = [[NSArray alloc] initWithObjects:@"I have many healthy, safe, and secure connections with friends and participate in a variety of fun activities with them.", @"I have some healthy, safe, and secure friends but we do not go out or do fun things to do together.", @"I need to branch out more and develop new connections.", @" I need to do more exciting activities and events with my friends.", nil];
    
    reasonsArray6 = [[NSArray alloc] initWithObjects:@"My family is a great source of support, security, and connection.", @"My family is active in my life but isn't the first group of people I turn to in a time of need.", @"My family is not present in my life.", @"My family is unhealthy to be around.", nil];
    
    reasonsArray7 = [[NSArray alloc] initWithObjects:@"I have 5 or more relationships in my life that I consider healthy, significant, and secure.", @"I have 2-3 relationships in my life that I consider healthy, significant, and secure but a few relationships that are unhealthy as well.", @"I need more healthy relationships in my life.", nil];
    
    reasonsArray8 = [[NSArray alloc] initWithObjects:@"I am extremely driven and have great direction.", @"I lack direction.", @"I lack the drive and energy.", @"I lack both the energy/drive and direction to make things happen.", nil];
    
    reasonsArray9 = [[NSArray alloc] initWithObjects:@"Aside from work, I have multiple activities each week that I am passionate about and love participating in.", @"I enjoy some of the tasks I do, but need more.", @"I don't enjoy any of the tasks throughout the week/month.", nil];
    
    reasonsArray10 = [[NSArray alloc] initWithObjects:@"I exercise 3 or more times a week and make this a priority.", @"I make it to the gym a few days a week but need to get more into it.", @"I don't exercise at all and need to start somewhere.", nil];
    
    reasonsArray11 = [[NSArray alloc] initWithObjects:@"I am a very happy and positive person.", @"I am typically happy, but have my ups and downs.", @"Life seems somewhat grey and not very exciting.", nil];
    
    reasonsArray12 = [[NSArray alloc] initWithObjects:@"I feel mentally and physically healthy and invigorated.", @"I could use a little emotional/physical boost.", @"I absolutely need to feel better emotionally and physically.", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"MANAGED OBJECT %@", self.managedObjectContext);
    
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = delegate.managedObjectContext;
    
    [self performFetch];
    [self loadIvars];

    
   
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    NSDictionary *buttonAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], UITextAttributeTextColor, nil];
    [self.btn setTitleTextAttributes:buttonAttributes forState:UIControlStateNormal];
    
    self.scrollView.contentSize = CGSizeMake(3600, 300);
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.delaysContentTouches = NO;
    self.scrollView.userInteractionEnabled = YES;
    
    UIFont *romanFont = [UIFont fontWithName:@"Times New Roman" size:24.0f];
    [self loadReasonArrays];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    tap12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedView:)];
    
    // FIRST VIEW
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 320)];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    firstView.layer.borderWidth = 1.0f;
    firstView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    firstView.layer.shadowOpacity = 1.0;
    firstView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);

    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    firstLabel.textAlignment = NSTextAlignmentCenter;
    firstLabel.textColor = [UIColor blackColor];
    firstLabel.font = romanFont;
    firstLabel.text = @"Quality of friends";
    [firstView addSubview:firstLabel];
    
    firstReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    firstReason.userInteractionEnabled = YES;
    [firstReason addGestureRecognizer:tap];
    if (grade.firstReason) {
        firstReason.text = reasonOne;
    } else {
        firstReason.text = @"Select a reason";
    }
    firstReason.numberOfLines = 0;
    firstReason.textAlignment = NSTextAlignmentCenter;
    firstReason.backgroundColor = [UIColor clearColor];
    firstReason.textColor = [UIColor lightGrayColor];
    firstReason.lineBreakMode = NSLineBreakByWordWrapping;
    firstReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [firstView addSubview:firstReason];
    
    firstSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    firstSlider.value = 5;
    /*
    if (grade.firstGrade) {
        firstSlider.value = [firstGrade floatValue];
    } else {
         firstSlider.value = 0;   
    }
     */
    firstSlider.minimumValue = 0;
    firstSlider.maximumValue = 5;
    [firstSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [firstView addSubview:firstSlider];
    
    firstGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    firstGradeLabel.text = [NSString stringWithFormat:@"%@", firstGrade];
    [firstView addSubview:firstGradeLabel];
    
    
    
    
    //SECOND VIEW
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(300, 0, 280, 320)];
    secondView.backgroundColor = [UIColor whiteColor];
    secondView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    secondView.layer.borderWidth = 1.0f;
    secondView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    secondView.layer.shadowOpacity = 1.0;
    secondView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 75)];
    secondLabel.textAlignment = NSTextAlignmentCenter;
    secondLabel.textColor = [UIColor blackColor];
    secondLabel.numberOfLines = 0;
    secondLabel.lineBreakMode = NSLineBreakByWordWrapping;
    secondLabel.font = romanFont;
    secondLabel.text = @"Current relationship status";
    [secondView addSubview:secondLabel];
    
    secondReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    secondReason.userInteractionEnabled = YES;
    [secondReason addGestureRecognizer:tap2];
    if (grade.secondReason) {
        secondReason.text = reasonTwo;
    } else {
    secondReason.text = @"Select a reason";
    }
    secondReason.numberOfLines = 0;
    secondReason.textAlignment = NSTextAlignmentCenter;
    secondReason.backgroundColor = [UIColor clearColor];
    secondReason.textColor = [UIColor lightGrayColor];
    secondReason.lineBreakMode = NSLineBreakByWordWrapping;
    secondReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [secondView addSubview:secondReason];
    
    secondSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.secondGrade) {
        secondSlider.value = [secondGrade floatValue];
    } else {
    secondSlider.value = 0;
    }
    secondSlider.minimumValue = 0;
    secondSlider.maximumValue = 5;
    [secondSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [secondView addSubview:secondSlider];
    
    secondGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    secondGradeLabel.text = @"A";
    [secondView addSubview:secondGradeLabel];
    
    
    // THIRD VIEW
    
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectMake(600, 0, 280, 320)];
    thirdView.backgroundColor = [UIColor whiteColor];
    thirdView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    thirdView.layer.borderWidth = 1.0f;
    thirdView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    thirdView.layer.shadowOpacity = 1.0;
    thirdView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    thirdLabel.textColor = [UIColor blackColor];
    thirdLabel.font = romanFont;
    thirdLabel.text = @"Financial security";
    [thirdView addSubview:thirdLabel];
    
    thirdReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    thirdReason.userInteractionEnabled = YES;
    [thirdReason addGestureRecognizer:tap3];
    if (grade.thirdReason) {
        thirdReason.text = reasonThree;
    } else {
    thirdReason.text = @"Select a reason";
    }
    thirdReason.numberOfLines = 0;
    thirdReason.textAlignment = NSTextAlignmentCenter;
    thirdReason.backgroundColor = [UIColor clearColor];
    thirdReason.textColor = [UIColor lightGrayColor];
    thirdReason.lineBreakMode = NSLineBreakByWordWrapping;
    thirdReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [thirdView addSubview:thirdReason];
    
    
    thirdSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.thirdGrade) {
        thirdSlider.value = [thirdGrade floatValue];
    } else {
         thirdSlider.value = 0;   
    }
    thirdSlider.minimumValue = 0;
    thirdSlider.maximumValue = 5;
    [thirdSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [thirdView addSubview:thirdSlider];
    
    thirdGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    thirdGradeLabel.text = @"A";
    [thirdView addSubview:thirdGradeLabel];
    
    
    // FOURTH VIEW
    
    UIView *fourthView = [[UIView alloc] initWithFrame:CGRectMake(900, 0, 280, 320)];
    fourthView.backgroundColor = [UIColor whiteColor];
    fourthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    fourthView.layer.borderWidth = 1.0f;
    fourthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    fourthView.layer.shadowOpacity = 1.0;
    fourthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *fourthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    fourthLabel.textAlignment = NSTextAlignmentCenter;
    fourthLabel.textColor = [UIColor blackColor];
    fourthLabel.font = romanFont;
    fourthLabel.text = @"Job happiness";
    [fourthView addSubview:fourthLabel];
    
    fourthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    fourthReason.userInteractionEnabled = YES;
    [fourthReason addGestureRecognizer:tap4];
    if (grade.fourthReason) {
        fourthReason.text = reasonFour;
    } else {
    fourthReason.text = @"Select a reason";
    }
    fourthReason.numberOfLines = 0;
    fourthReason.textAlignment = NSTextAlignmentCenter;
    fourthReason.backgroundColor = [UIColor clearColor];
    fourthReason.textColor = [UIColor lightGrayColor];
    fourthReason.lineBreakMode = NSLineBreakByWordWrapping;
    fourthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [fourthView addSubview:fourthReason];
    
    fourthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.fourthGrade) {
        fourthSlider.value = [fourthGrade floatValue];
    } else {
         fourthSlider.value = 0;   
    }
    fourthSlider.minimumValue = 0;
    fourthSlider.maximumValue = 5;
    [fourthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [fourthView addSubview:fourthSlider];
    
    fourthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    fourthGradeLabel.text = @"A";
    [fourthView addSubview:fourthGradeLabel];
    
    
    
    // FIFTH VIEW
    
    
    UIView *fifthView = [[UIView alloc] initWithFrame:CGRectMake(1200, 0, 280, 320)];
    fifthView.backgroundColor = [UIColor whiteColor];
    fifthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    fifthView.layer.borderWidth = 1.0f;
    fifthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    fifthView.layer.shadowOpacity = 1.0;
    fifthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *fifthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    fifthLabel.textAlignment = NSTextAlignmentCenter;
    fifthLabel.textColor = [UIColor blackColor];
    fifthLabel.numberOfLines = 0;
    fifthLabel.font = romanFont;
    fifthLabel.text = @"Depth of social life";
    [fifthView addSubview:fifthLabel];
    
    fifthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    fifthReason.userInteractionEnabled = YES;
    [fifthReason addGestureRecognizer:tap5];
    if (grade.fifthReason) {
        fifthReason.text = reasonFive;
    } else {
     fifthReason.text = @"Select a reason";   
    }
    fifthReason.numberOfLines = 0;
    fifthReason.textAlignment = NSTextAlignmentCenter;
    fifthReason.backgroundColor = [UIColor clearColor];
    fifthReason.textColor = [UIColor lightGrayColor];
    fifthReason.lineBreakMode = NSLineBreakByWordWrapping;
    fifthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [fifthView addSubview:fifthReason];
    
    fifthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.fifthGrade) {
        fifthSlider.value = [fifthGrade floatValue];
    } else {
         fifthSlider.value = 0;   
    }
    fifthSlider.minimumValue = 0;
    fifthSlider.maximumValue = 5;
    [fifthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [fifthView addSubview:fifthSlider];
    
    fifthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    fifthGradeLabel.text = @"A";
    [fifthView addSubview:fifthGradeLabel];
    
    
    // SIXTH VIEW
    
    UIView *sixthView = [[UIView alloc] initWithFrame:CGRectMake(1500, 0, 280, 320)];
    sixthView.backgroundColor = [UIColor whiteColor];
    sixthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    sixthView.layer.borderWidth = 1.0f;
    sixthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    sixthView.layer.shadowOpacity = 1.0;
    sixthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *sixthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    sixthLabel.textAlignment = NSTextAlignmentCenter;
    sixthLabel.textColor = [UIColor blackColor];
    sixthLabel.font = romanFont;
    sixthLabel.text = @"Family involvement";
    [sixthView addSubview:sixthLabel];
    
    sixthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    sixthReason.userInteractionEnabled = YES;
    [sixthReason addGestureRecognizer:tap6];
    if (grade.sixthReason) {
        sixthReason.text = reasonSix;
    } else {
         sixthReason.text = @"Select a reason";   
    }
    sixthReason.numberOfLines = 0;
    sixthReason.textAlignment = NSTextAlignmentCenter;
    sixthReason.backgroundColor = [UIColor clearColor];
    sixthReason.textColor = [UIColor lightGrayColor];
    sixthReason.lineBreakMode = NSLineBreakByWordWrapping;
    sixthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [sixthView addSubview:sixthReason];
    
    sixthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.sixthGrade) {
        sixthSlider.value = [sixthGrade floatValue];
    } else {
    sixthSlider.value = 0;
    }
    sixthSlider.minimumValue = 0;
    sixthSlider.maximumValue = 5;
    [sixthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [sixthView addSubview:sixthSlider];
    
    sixthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    sixthGradeLabel.text = @"A";
    [sixthView addSubview:sixthGradeLabel];
    
    
    // SEVENTH VIEW
    
    UIView *seventhView = [[UIView alloc] initWithFrame:CGRectMake(1800, 0, 280, 320)];
    seventhView.backgroundColor = [UIColor whiteColor];
    seventhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    seventhView.layer.borderWidth = 1.0f;
    seventhView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    seventhView.layer.shadowOpacity = 1.0;
    seventhView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *seventhLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    seventhLabel.textAlignment = NSTextAlignmentCenter;
    seventhLabel.textColor = [UIColor blackColor];
    seventhLabel.font = romanFont;
    seventhLabel.text = @"Quality of relationships";
    [seventhView addSubview:seventhLabel];
    
    seventhReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    seventhReason.userInteractionEnabled = YES;
    [seventhReason addGestureRecognizer:tap7];
    if (grade.seventhReason) {
        seventhReason.text = reasonSeven;
    } else {
         seventhReason.text = @"Select a reason";   
    }
    seventhReason.numberOfLines = 0;
    seventhReason.textAlignment = NSTextAlignmentCenter;
    seventhReason.backgroundColor = [UIColor clearColor];
    seventhReason.textColor = [UIColor lightGrayColor];
    seventhReason.lineBreakMode = NSLineBreakByWordWrapping;
    seventhReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [seventhView addSubview:seventhReason];
    
    seventhSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.seventhGrade) {
        seventhSlider.value = [seventhGrade floatValue];
    } else {
         seventhSlider.value = 0;   
    }
    seventhSlider.minimumValue = 0;
    seventhSlider.maximumValue = 5;
    [seventhSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [seventhView addSubview:seventhSlider];
    
    seventhGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    seventhGradeLabel.text = @"A";
    [seventhView addSubview:seventhGradeLabel];
    
    
    // EIGHTH VIEW
    
    UIView *eighthView = [[UIView alloc] initWithFrame:CGRectMake(2100, 0, 280, 320)];
    eighthView.backgroundColor = [UIColor whiteColor];
    eighthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    eighthView.layer.borderWidth = 1.0f;
    eighthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    eighthView.layer.shadowOpacity = 1.0;
    eighthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *eighthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    eighthLabel.textAlignment = NSTextAlignmentCenter;
    eighthLabel.textColor = [UIColor blackColor];
    eighthLabel.font = romanFont;
    eighthLabel.text = @"Motivation level";
    [eighthView addSubview:eighthLabel];
    
    eighthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    eighthReason.userInteractionEnabled = YES;
    [eighthReason addGestureRecognizer:tap8];
    if (grade.eighthReason) {
        eighthReason.text = reasonEighth;
    } else {
         eighthReason.text = @"Select a reason";   
    }
    eighthReason.numberOfLines = 0;
    eighthReason.textAlignment = NSTextAlignmentCenter;
    eighthReason.backgroundColor = [UIColor clearColor];
    eighthReason.textColor = [UIColor lightGrayColor];
    eighthReason.lineBreakMode = NSLineBreakByWordWrapping;
    eighthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [eighthView addSubview:eighthReason];
    
    eighthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.eighthGrade) {
        eighthSlider.value = [eighthGrade floatValue];
    } else {
         eighthSlider.value = 0;   
    }
    eighthSlider.minimumValue = 0;
    eighthSlider.maximumValue = 5;
    [eighthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [eighthView addSubview:eighthSlider];
    
    eighthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    eighthGradeLabel.text = @"A";
    [eighthView addSubview:eighthGradeLabel];
    
    
    // NINTH VIEW
    
    UIView *ninthView = [[UIView alloc] initWithFrame:CGRectMake(2400, 0, 280, 320)];
    ninthView.backgroundColor = [UIColor whiteColor];
    ninthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ninthView.layer.borderWidth = 1.0f;
    ninthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    ninthView.layer.shadowOpacity = 1.0;
    ninthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *ninthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    ninthLabel.textAlignment = NSTextAlignmentCenter;
    ninthLabel.textColor = [UIColor blackColor];
    ninthLabel.numberOfLines = 0;
    ninthLabel.lineBreakMode = NSLineBreakByWordWrapping;
    ninthLabel.font = romanFont;
    ninthLabel.text = @"Time spent on enjoyable tasks";
    [ninthView addSubview:ninthLabel];
    
    ninthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    ninthReason.userInteractionEnabled = YES;
    [ninthReason addGestureRecognizer:tap9];
    if (grade.ninthReason) {
        ninthReason.text = reasonNine;
    } else {
            ninthReason.text = @"Select a reason";
    }
    ninthReason.numberOfLines = 0;
    ninthReason.textAlignment = NSTextAlignmentCenter;
    ninthReason.backgroundColor = [UIColor clearColor];
    ninthReason.textColor = [UIColor lightGrayColor];
    ninthReason.lineBreakMode = NSLineBreakByWordWrapping;
    ninthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [ninthView addSubview:ninthReason];
    
    ninthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.ninthGrade) {
        ninthSlider.value = [ninthGrade floatValue];
    } else {
         ninthSlider.value = 0;   
    }
    ninthSlider.minimumValue = 0;
    ninthSlider.maximumValue = 5;
    [ninthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [ninthView addSubview:ninthSlider];
    
    ninthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    ninthGradeLabel.text = @"A";
    [ninthView addSubview:ninthGradeLabel];
    
    
    // TENTH VIEW
    
    UIView *tenthView = [[UIView alloc] initWithFrame:CGRectMake(2700, 0, 280, 320)];
    tenthView.backgroundColor = [UIColor whiteColor];
    tenthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    tenthView.layer.borderWidth = 1.0f;
    tenthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    tenthView.layer.shadowOpacity = 1.0;
    tenthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *tenthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    tenthLabel.textAlignment = NSTextAlignmentCenter;
    tenthLabel.textColor = [UIColor blackColor];
    tenthLabel.numberOfLines = 0;
    tenthLabel.lineBreakMode = NSLineBreakByWordWrapping;
    tenthLabel.font = romanFont;
    tenthLabel.text = @"Physical activity and Exercise level";
    [tenthView addSubview:tenthLabel];
    
    tenthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    tenthReason.userInteractionEnabled = YES;
    [tenthReason addGestureRecognizer:tap10];
    if (grade.tenthReason) {
        tenthReason.text = reasonTen;
    } else {
         tenthReason.text = @"Select a reason";   
    }
    tenthReason.numberOfLines = 0;
    tenthReason.textAlignment = NSTextAlignmentCenter;
    tenthReason.backgroundColor = [UIColor clearColor];
    tenthReason.textColor = [UIColor lightGrayColor];
    tenthReason.lineBreakMode = NSLineBreakByWordWrapping;
    tenthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [tenthView addSubview:tenthReason];
    
    tenthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.tenthGrade) {
        tenthSlider.value = [tenthGrade floatValue];
    } else {
    tenthSlider.value = 0;
    }
    tenthSlider.minimumValue = 0;
    tenthSlider.maximumValue = 5;
    [tenthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [tenthView addSubview:tenthSlider];
    
    tenthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    tenthGradeLabel.text = @"A";
    [tenthView addSubview:tenthGradeLabel];
    
    
    // ELEVENTH VIEW
    
    UIView *eleventhView = [[UIView alloc] initWithFrame:CGRectMake(3000, 0, 280, 320)];
    eleventhView.backgroundColor = [UIColor whiteColor];
    eleventhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    eleventhView.layer.borderWidth = 1.0f;
    eleventhView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    eleventhView.layer.shadowOpacity = 1.0;
    eleventhView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *eleventhLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    eleventhLabel.textAlignment = NSTextAlignmentCenter;
    eleventhLabel.textColor = [UIColor blackColor];
    [eleventhLabel setFont:romanFont];
    eleventhLabel.text = @"Overall Mood";
    [eleventhView addSubview:eleventhLabel];
    
    eleventhReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    eleventhReason.userInteractionEnabled = YES;
    [eleventhReason addGestureRecognizer:tap11];
    if (grade.eleventhReason) {
        eleventhReason.text = reasonEleven;
    } else {
         eleventhReason.text = @"Select a reason";   
    }
    eleventhReason.numberOfLines = 0;
    eleventhReason.textAlignment = NSTextAlignmentCenter;
    eleventhReason.backgroundColor = [UIColor clearColor];
    eleventhReason.textColor = [UIColor lightGrayColor];
    eleventhReason.lineBreakMode = NSLineBreakByWordWrapping;
    eleventhReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [eleventhView addSubview:eleventhReason];
    
    eleventhSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.eleventhGrade) {
        eleventhSlider.value = [eleventhGrade floatValue];
    } else {
         eleventhSlider.value = 0;   
    }
    eleventhSlider.minimumValue = 0;
    eleventhSlider.maximumValue = 5;
    [eleventhSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [eleventhView addSubview:eleventhSlider];
    
    eleventhGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    eleventhGradeLabel.text = @"A";
    [eleventhView addSubview:eleventhGradeLabel];
    
    
    // TWELFTH VIEW
    
    UIView *twelfthView = [[UIView alloc] initWithFrame:CGRectMake(3300, 0, 280, 320)];
    twelfthView.backgroundColor = [UIColor whiteColor];
    twelfthView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    twelfthView.layer.borderWidth = 1.0f;
    twelfthView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    twelfthView.layer.shadowOpacity = 1.0;
    twelfthView.layer.shadowOffset = CGSizeMake(10.0, 10.0f);
    
    UILabel *twelfthLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 50)];
    twelfthLabel.textAlignment = NSTextAlignmentCenter;
    twelfthLabel.textColor = [UIColor blackColor];
    twelfthLabel.numberOfLines = 0;
    twelfthLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [twelfthLabel setFont:romanFont];
    twelfthLabel.text = @"Emotional and physical health";
    [twelfthView addSubview:twelfthLabel];
    
    twelfthReason = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 220, 100)];
    twelfthReason.userInteractionEnabled = YES;
    [twelfthReason addGestureRecognizer:tap12];
    if (grade.twelfthReason) {
        twelfthReason.text = reasonTwelve;
    } else {
         twelfthReason.text = @"Select a reason";   
    }
    twelfthReason.numberOfLines = 0;
    twelfthReason.textAlignment = NSTextAlignmentCenter;
    twelfthReason.backgroundColor = [UIColor clearColor];
    twelfthReason.textColor = [UIColor lightGrayColor];
    twelfthReason.lineBreakMode = NSLineBreakByWordWrapping;
    twelfthReason.font = [UIFont italicSystemFontOfSize:15.0f];
    [twelfthView addSubview:twelfthReason];
    
    twelfthSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 200, 50)];
    if (grade.twelfthGrade) {
        twelfthSlider.value = [twelfthGrade floatValue];
    } else {
         twelfthSlider.value = 0;   
    }
    twelfthSlider.minimumValue = 0;
    twelfthSlider.maximumValue = 5;
    [twelfthSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    [twelfthView addSubview:twelfthSlider];
    
    twelfthGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    twelfthGradeLabel.text = @"A";
    [twelfthView addSubview:twelfthGradeLabel];
    
    
    
    
    [self.scrollView addSubview:firstView];
    [self.scrollView addSubview:secondView];
    [self.scrollView addSubview:thirdView];
    [self.scrollView addSubview:fourthView];
    [self.scrollView addSubview:fifthView];
    [self.scrollView addSubview:sixthView];
    [self.scrollView addSubview:seventhView];
    [self.scrollView addSubview:eighthView];
    [self.scrollView addSubview:ninthView];
    [self.scrollView addSubview:tenthView];
    [self.scrollView addSubview:eleventhView];
    [self.scrollView addSubview:twelfthView];
    
    
    
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

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
    
    
    NSLog(@"TOUCHES SHOULD BEGIN");
    
    return NO;
}


- (void)sliderMoved:(UISlider *)slider {
    
    NSLog(@"SLIDER MOVED: %f", slider.value);
    
    NSString *gradeString = [NSString stringWithFormat:@"%ld", lroundf(slider.value)];
    
    if (slider == firstSlider) {
        firstGrade = [NSNumber numberWithInt:slider.value];
        firstGradeLabel.text = gradeString;
    } else if (slider == secondSlider) {
        secondGrade = [NSNumber numberWithInt:slider.value];
        secondGradeLabel.text = gradeString;
    } else if (slider == thirdSlider) {
        thirdGrade = [NSNumber numberWithInt:slider.value];
        thirdGradeLabel.text = gradeString;
    } else if (slider == fourthSlider) {
        fourthGrade = [NSNumber numberWithInt:slider.value];
        fourthGradeLabel.text = gradeString;
    } else if (slider == fifthSlider) {
        fifthGrade = [NSNumber numberWithInt:slider.value];
        fifthGradeLabel.text = gradeString;
    } else if (slider == sixthSlider) {
        sixthGrade = [NSNumber numberWithInt:slider.value];
        sixthGradeLabel.text = gradeString;
    } else if (slider == seventhSlider) {
        seventhGrade = [NSNumber numberWithInt:slider.value];
        seventhGradeLabel.text = gradeString;
    } else if (slider == eighthSlider) {
        eighthGrade = [NSNumber numberWithInt:slider.value];
        eighthGradeLabel.text = gradeString;
    } else if (slider == ninthSlider) {
        ninthGrade = [NSNumber numberWithInt:slider.value];
        ninthGradeLabel.text = gradeString;
    } else if (slider == tenthSlider) {
        tenthGrade = [NSNumber numberWithInt:slider.value];
        tenthGradeLabel.text = gradeString;
    } else if (slider == eleventhSlider){
        eleventhGrade = [NSNumber numberWithInt:slider.value];
        eleventhGradeLabel.text = gradeString;
    } else if (slider == twelfthSlider) {
        twelfthGrade = [NSNumber numberWithInt:slider.value];
        twelfthGradeLabel.text = gradeString;
    }
}



- (void)selectedView:(id)sender {
    
    NSLog(@"SELECTED VIEW PRESSED");
    
    ReasonViewController *controller = [[ReasonViewController alloc] initWithNibName:@"ReasonViewController" bundle:nil];
    controller.delegate = self;
    
    if (sender == tap) {
        controller.reasonsArray = reasonsArray;
    } else if (sender == tap2) {
        
        controller.reasonsArray = reasonsArray2;
    } else if (sender == tap3) {
        controller.reasonsArray = reasonsArray3;
    } else if (sender == tap4) {
        controller.reasonsArray = reasonsArray4;
    } else if (sender == tap5) {
        controller.reasonsArray = reasonsArray5;
    } else if (sender == tap6) {
        controller.reasonsArray = reasonsArray6;
    } else if (sender == tap7) {
        controller.reasonsArray = reasonsArray7;
    } else if (sender == tap8) {
        controller.reasonsArray = reasonsArray8;
    } else if (sender == tap9) {
        controller.reasonsArray = reasonsArray9;
    } else if (sender == tap10) {
        controller.reasonsArray = reasonsArray10;
    } else if (sender == tap11) {
        controller.reasonsArray = reasonsArray11;
    } else if (sender == tap12) {
        controller.reasonsArray = reasonsArray12;
    }
    
    [controller presentInParentViewController:self];
    
    
}


- (void)dealloc {
    
    NSLog(@"GRADE VIEW DEALLOC");
}


- (void)reasonsViewController:(ReasonViewController *)controller didSelectReason:(NSString *)reason {
 
    NSLog(@"DID SELECT REASON");
    
    
    if (controller.reasonsArray == reasonsArray) {
        firstReason.text = reason;
        reasonOne = reason;
    } else if (controller.reasonsArray == reasonsArray2) {
        secondReason.text = reason;
        reasonTwo = reason;
    } else if (controller.reasonsArray == reasonsArray3) {
        thirdReason.text = reason;
        reasonThree = reason;
    } else if (controller.reasonsArray == reasonsArray4) {
        fourthReason.text = reason;
        reasonFour = reason;
    } else if (controller.reasonsArray == reasonsArray5) {
        fifthReason.text = reason;
        reasonFive = reason;
    } else if (controller.reasonsArray == reasonsArray6) {
        sixthReason.text = reason;
        reasonSix = reason;
    } else if (controller.reasonsArray == reasonsArray7) {
        seventhReason.text = reason;
        reasonSeven = reason;
    } else if (controller.reasonsArray == reasonsArray8) {
        eighthReason.text = reason;
        reasonEighth = reason;
    } else if (controller.reasonsArray == reasonsArray9) {
        ninthReason.text = reason;
        reasonNine = reason;
    } else if (controller.reasonsArray == reasonsArray10) {
        tenthReason.text = reason;
        reasonTen = reason;
    } else if (controller.reasonsArray == reasonsArray11) {
        eleventhReason.text = reason;
        reasonEleven = reason;
    } else if (controller.reasonsArray == reasonsArray12) {
        twelfthReason.text = reason;
        reasonTwelve = reason;
    }
    
    
}


// DONE BUTTON PRESSED

- (IBAction)buttonPressed:(id)sender {
    
    NSLog(@"BUTTON PRESSED");
    
    if (grade) {
        
        [self.managedObjectContext deleteObject:grade];

    }
    
    
    grade = [NSEntityDescription insertNewObjectForEntityForName:@"Grade" inManagedObjectContext:self.managedObjectContext];
    
    grade.firstGrade = firstGrade;
    grade.secondGrade = secondGrade;
    grade.thirdGrade = thirdGrade;
    grade.fourthGrade = fourthGrade;
    grade.fifthGrade = fifthGrade;
    grade.sixthGrade = sixthGrade;
    grade.seventhGrade = seventhGrade;
    grade.eighthGrade = eighthGrade;
    grade.ninthGrade = ninthGrade;
    grade.tenthGrade = tenthGrade;
    grade.eleventhGrade = eleventhGrade;
    grade.twelfthGrade = twelfthGrade;
    
    grade.firstReason = reasonOne;
    grade.secondReason = reasonTwo;
    grade.thirdReason = reasonThree;
    grade.fourthReason = reasonFour;
    grade.fifthReason = reasonFive;
    grade.sixthReason = reasonSix;
    grade.seventhReason = reasonSeven;
    grade.eighthReason = reasonEighth;
    grade.ninthReason = reasonNine;
    grade.tenthReason = reasonTen;
    grade.eleventhReason = reasonEleven;
    grade.twelfthReason = reasonTwelve;
    
    scoreArray = [NSArray arrayWithObjects:firstGrade, secondGrade, thirdGrade, fourthGrade, fifthGrade, seventhGrade,
                  eighthGrade, ninthGrade, tenthGrade, eleventhGrade, twelfthGrade, nil];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"GRADE SAVE ERROR %@", error);
        abort();
    }
    
    int result = 0;
    for (int i = 0; i < [scoreArray count]; i++) {
        
        result += [[scoreArray objectAtIndex:i] intValue];
    }
    self.finalGrade = [NSNumber numberWithInt:result];
    NSLog(@"%d / 60", result);
    
    UIView *hudView = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    hudView.backgroundColor = [UIColor blackColor];
    //hudView.layer.borderColor = grayColor.CGColor;
    hudView.layer.borderWidth = 5.0f;
    hudView.layer.cornerRadius = 5.0f;
    hudView.alpha = 0;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.frame = CGRectMake(75, 50, 40, 40);
    [hudView addSubview:spinner];
    [spinner startAnimating];
    [self.view addSubview:hudView];
    
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 75)];
    text.textAlignment = NSTextAlignmentCenter;
    text.numberOfLines = 0;
    text.lineBreakMode = NSLineBreakByWordWrapping;
    text.font = [UIFont fontWithName:@"Times New Roman" size:24.0f];
    text.text = @"Analyzing your answers";
    text.textColor = [UIColor whiteColor];
    text.backgroundColor = [UIColor clearColor];
    [hudView addSubview:text];
    
    
    
    [UIView animateWithDuration:0.2 animations:^{
        hudView.alpha = 0.75;
    }];

    [self performSelector:@selector(loadFinalGradeView) withObject:nil afterDelay:1.0];
    
}

- (void)loadFinalGradeView {
    
    
     
     SWRevealViewController *revealController = self.revealViewController;
     FinalGradeViewController *finalGradeView = [[FinalGradeViewController alloc] init];
    finalGradeView.finalGrade = self.finalGrade;
     [revealController setFrontViewController:finalGradeView];
     finalGradeView.view.layer.opacity = 0.1f;
     [UIView animateWithDuration:0.3 animations:^{
     finalGradeView.view.layer.opacity = 1.0f;
     }];
     
    
    
}


@end

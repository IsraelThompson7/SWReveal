//
//  PrioritiesViewController.m
//  SWReveal
//
//  Created by scott mehus on 6/24/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "PrioritiesViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "Grade.h"
#import "GradeObj.h"

@interface PrioritiesViewController ()

@end

@implementation PrioritiesViewController {
    
    Grade *lastScore;
    
    NSNumber *scoreOne;
    NSNumber *scoreTwo;
    NSNumber *scoreThree;
    NSNumber *scoreFour;
    NSNumber *scoreFive;
    NSNumber *scoreSix;
    NSNumber *scoreSeven;
    NSNumber *scoreEight;
    NSNumber *scoreNine;
    NSNumber *scoreTen;
    NSNumber *scoreEleven;
    NSNumber *scoreTwelve;
    
    NSString *reasonOne;
    NSString *reasonTwo;
    NSString *reasonThree;
    NSString *reasonFour;
    NSString *reasonFive;
    NSString *reasonSix;
    NSString *reasonSeven;
    NSString *reasonEight;
    NSString *reasonNine;
    NSString *reasonTen;
    NSString *reasonEleven;
    NSString *reasonTwelve;
    
    NSMutableArray *scoreArray;
    NSMutableArray *reasonArray;
    
    NSMutableArray *gradeArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
        NSLog(@"PRIORITIES FETCH FAILED");
        return;
    }
    
    lastScore = [foundObjects lastObject];
    NSLog(@"LAST GRADE %@", lastScore);
    
    if (lastScore.firstGrade != nil) {
        scoreOne = lastScore.firstGrade;
        reasonOne = lastScore.firstReason;
    } else {
        scoreOne = [NSNumber numberWithInt:1];
        reasonOne = @"No Reason";
    }
    if (lastScore.secondGrade != nil) {
        scoreTwo = lastScore.secondGrade;
        reasonTwo = lastScore.secondReason;
    } else {
        scoreTwo = [NSNumber numberWithInt:1];
        reasonTwo = @"No Reason";
    }
    if (lastScore.thirdGrade != nil) {
        scoreThree = lastScore.thirdGrade;
        reasonThree = lastScore.thirdReason;
    } else {
        scoreThree = [NSNumber numberWithInt:1];
        reasonThree = @"No Reason";
    }
    if (lastScore.fourthGrade != nil) {
        scoreFour = lastScore.fourthGrade;
        reasonFour = lastScore.fourthReason;
    } else {
        scoreFour = [NSNumber numberWithInt:1];
        reasonFour = @"No Reason";
    }
    if (lastScore.fifthGrade != nil) {
        scoreFive = lastScore.fifthGrade;
        reasonFive = lastScore.fifthReason;
    } else {
        scoreFive = [NSNumber numberWithInt:1];
        reasonFive = @"No Reason";
    }
    if (lastScore.sixthGrade != nil) {
        scoreSix = lastScore.sixthGrade;
        reasonSix = lastScore.sixthReason;
    } else {
        scoreSix = [NSNumber numberWithInt:1];
        reasonSix = @"No Reason";
    }
    if (lastScore.seventhGrade != nil) {
        scoreSeven = lastScore.seventhGrade;
        reasonSeven = lastScore.seventhReason;
    } else {
        scoreSeven = [NSNumber numberWithInt:1];
        reasonSeven = @"No Reason";
    }
    if (lastScore.eighthGrade != nil) {
        scoreEight = lastScore.eighthGrade;
        reasonEight = lastScore.eighthReason;
    } else {
        scoreEight = [NSNumber numberWithInt:1];
        reasonEight = @"No Reason";
    }
    if (lastScore.ninthGrade != nil) {
        scoreNine = lastScore.ninthGrade;
        reasonNine = lastScore.ninthReason;
    } else {
        scoreNine = [NSNumber numberWithInt:1];
        reasonNine = @"No Reason";
    }
    if (lastScore.tenthGrade != nil) {
        scoreTen = lastScore.tenthGrade;
        reasonTen = lastScore.tenthReason;
    } else {
        scoreTen = [NSNumber numberWithInt:1];
        reasonTen = @"No Reason";
    }
    if (lastScore.eleventhGrade != nil) {
        scoreEleven = lastScore.eleventhGrade;
        reasonEleven = lastScore.eleventhReason;
    } else {
        scoreEleven = [NSNumber numberWithInt:1];
        reasonEleven = @"No Reason";
    }
    if (lastScore.twelfthGrade != nil) {
        scoreTwelve = lastScore.twelfthGrade;
        reasonTwelve = lastScore.twelfthReason;
    } else {
        scoreTwelve = [NSNumber numberWithInt:1];
        reasonTwelve = @"No Reason";
    }
  
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = delegate.managedObjectContext;
    [self performFetch];
    
    
    
    scoreArray = [[NSMutableArray alloc] initWithObjects:scoreOne,
                  scoreTwo, scoreThree, scoreFour, scoreFive, scoreSix, scoreSeven, scoreEight,
                  scoreNine, scoreTen, scoreEleven, scoreTwelve, nil];
    
    reasonArray = [[NSMutableArray alloc] initWithObjects:reasonOne, reasonTwo, reasonThree,
                   reasonFour, reasonFive, reasonSix, reasonSeven, reasonEight, reasonNine,
                   reasonTen, reasonEleven, reasonTwelve, nil];
    gradeArray = [[NSMutableArray alloc] initWithCapacity:12];
    
    for (int i = 0; i < 11; i++) {
        
        GradeObj *grade = [[GradeObj alloc] init];
        grade.gradeNumber = [scoreArray objectAtIndex:i];
        grade.gradeReason = [reasonArray objectAtIndex:i];
        [gradeArray addObject:grade];
    }
    
    [gradeArray sortUsingSelector:@selector(compareName:)];
    
    for (GradeObj *grade in gradeArray) {
        
        NSLog(@"GRADE NUMBER: %@", grade.gradeNumber);
    }
    
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
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    GradeObj *grade = [gradeArray objectAtIndex:indexPath.row];
    cell.textLabel.text = grade.gradeReason;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", grade.gradeNumber];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}














@end

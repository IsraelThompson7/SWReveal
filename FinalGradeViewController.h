//
//  FinalGradeViewController.h
//  SWReveal
//
//  Created by scott mehus on 6/26/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface FinalGradeViewController : UIViewController<UIAlertViewDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSNumber *finalGrade;

@end

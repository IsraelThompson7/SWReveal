//
//  ReasonViewController.h
//  SWReveal
//
//  Created by scott mehus on 7/1/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReasonViewController;
@protocol ReasonViewControllerDelegate <NSObject>

- (void)reasonsViewController:(ReasonViewController *)controller didSelectReason:(NSString *)reason;

@end

@interface ReasonViewController : UIViewController

@property (nonatomic, assign) id <ReasonViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *reasonsArray;

@end

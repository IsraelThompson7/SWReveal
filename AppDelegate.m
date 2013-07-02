//
//  AppDelegate.m
//  SWReveal
//
//  Created by scott mehus on 6/22/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "AppDelegate.h"
#import "OpeningViewController.h"
#import "RearTableViewController.h"
#import "SWRevealViewController.h"


@interface AppDelegate()<SWRevealViewControllerDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor lightGrayColor],UITextAttributeTextColor,
                                               [UIColor whiteColor], UITextAttributeTextShadowColor,
                                               [NSValue valueWithUIOffset:UIOffsetMake(-1, 0)], UITextAttributeTextShadowOffset, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window = window;
    
	RearTableViewController *rearViewController = [[RearTableViewController alloc] init];
    OpeningViewController *frontViewController = [[OpeningViewController alloc] init];
    
    
   // UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    
    SWRevealViewController *mainRevealController =
    [[SWRevealViewController alloc] initWithRearViewController:rearViewController frontViewController:frontViewController];
    
    mainRevealController.rearViewRevealWidth = 60;
    mainRevealController.rearViewRevealOverdraw = 120;
    mainRevealController.bounceBackOnOverdraw = NO;
    mainRevealController.stableDragOnOverdraw = YES;
    //[mainRevealController setFrontViewPosition:FrontViewPositionRight];
    
    mainRevealController.delegate = self;
    
	self.window.rootViewController = mainRevealController;
	[self.window makeKeyAndVisible];
	return YES;
    
    
   
    
    /*
    RearTableViewController *rearViewController = [[RearTableViewController alloc] init];
    FrontViewController *frontViewController = [[FrontViewController alloc] init];
    
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc] initWithRearViewController:rearViewController frontViewController:frontViewController];
    
    
    mainRevealController.rearViewRevealWidth = 60;
    mainRevealController.rearViewRevealOverdraw = 120;
    mainRevealController.bounceBackOnOverdraw = NO;
    mainRevealController.stableDragOnOverdraw = YES;
    [mainRevealController setFrontViewPosition:FrontViewPositionRight];
    
    mainRevealController.delegate = self;
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = mainRevealController;
    [self.window makeKeyAndVisible];
    return YES;
     */
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

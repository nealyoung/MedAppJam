//
//  AppDelegate.m
//  MedAppJam
//
//  Created by Nealon Young on 11/8/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "AppDelegate.h"

#import "EventsViewController.h"
#import "SVProgressHUD.h"
#import "UIFont+Application.h"

@interface AppDelegate ()

- (void)customizeAppearance;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [UIColor whiteColor];
    
    [self customizeAppearance];
    
    EventsViewController *eventsViewController = [[EventsViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:eventsViewController];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navigationController];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)customizeAppearance {
    [[UILabel appearance] setFont:[UIFont applicationFontOfSize:16.0f]];
    
    NSDictionary *barButtonTitleTextAttributes = @{NSFontAttributeName : [UIFont mediumApplicationFontOfSize:16.0f],
                                                   NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonTitleTextAttributes forState:UIControlStateNormal];
    
    NSDictionary *navBarTitleTextAttributes = @{NSFontAttributeName: [UIFont boldApplicationFontOfSize:19.0f],
                                                NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0xDD/255.0 green:0x6A/255.0 blue:0x4D/255.0 alpha:1.0f]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0xDD/255.0 green:0x6A/255.0 blue:0x4D/255.0 alpha:1.0f]];
    
    [[UIToolbar appearance] setBarTintColor:[UIColor colorWithRed:0xDD/255.0 green:0x6A/255.0 blue:0x4D/255.0 alpha:1.0f]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //{[[SVProgressHUD appearance] setHudBackgroundColor:[UIColor lightGrayColor]];
    //[[SVProgressHUD appearance] setHudRingForegroundColor:[UIColor colorWithRed:0xE0/255.0 green:0x79/255.0 blue:0x60/255.0 alpha:1.0f]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

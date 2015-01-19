//
//  AppDelegate.m
//  CareRingProfile
//
//  Created by James Stiehl on 1/10/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginScreen.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //look for NSUser defaults for first login. if not there return nil  create a bool called already logged in.  first time the app is run bool has not been created.  then the first screen needs to be loaded.
    self.request = [[HttpModule alloc] init];
   
    self.user = [NSUserDefaults standardUserDefaults];
    NSLog(@"%ld", (long)[self.user integerForKey:@"uid"]);
    
    if([self.user integerForKey:@"uid"] != 0){
        
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginScreen *loginScreen = [storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];
        [self.window makeKeyAndVisible];
        [self.window.rootViewController presentViewController:loginScreen animated:NO completion:^{
            NSLog(@"Login Screen Loaded");
        }];
    }
    
    

    return YES;
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

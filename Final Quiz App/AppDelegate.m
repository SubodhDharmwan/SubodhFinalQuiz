//
//  AppDelegate.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
@synthesize intLbl1Score,audioPlayer,intlevel2Score,intlevel3Score,intlevel4Score,intlevel5Score,score1,score2,score3,score4,score5,counter;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"ring" ofType:@"mp3"];
    
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    
    [audioPlayer play];
    
    audioPlayer.numberOfLoops=-1;
    return YES;
    
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [audioPlayer stop];
    
}




- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"audio"] isEqualToString:@"0"]) {
        [audioPlayer play];

    }
    else if([[[NSUserDefaults standardUserDefaults] valueForKey:@"audio"] isEqualToString:@"1"]){
        [audioPlayer stop];

    
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [audioPlayer stop];

}

@end

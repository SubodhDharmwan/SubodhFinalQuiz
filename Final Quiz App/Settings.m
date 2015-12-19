//
//  Settings.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "Settings.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

@interface Settings (){

}
@end

@implementation Settings
AppDelegate *app;

@synthesize btnSound;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    app=[[UIApplication sharedApplication]delegate];

   // [self.view setBackgroundColor:[UIColor colorWithRed:47/255.0 green:79/255.0 blue:79/255.0 alpha:1]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


#pragma mark - sound setting

- (IBAction)Sound:(id)sender {
    
    
    NSLog(@"state is = %i",btnSound.isOn);
    
    if(btnSound.isOn){
        
        [app.audioPlayer play];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"audio"];

       
    } else{
        [app.audioPlayer stop];
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"audio"];
    }
    
}

#pragma mark - reset settings

- (IBAction)btnResetSettingsTapped:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"app.intLbl1Score"];

    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"app.intlevel2Score"];
    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"app.intlevel3Score"];

    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"app.intlevel4Score"];

    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"app.intlevel5Score"];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Game reset" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    


}

- (IBAction)btnBackToHomeTapped:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
    
    }
@end

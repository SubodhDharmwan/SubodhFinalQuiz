//
//  ViewController.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "ViewController.h"
#import "Play.h"
#import "Settings.h"
#import "About.h"
#import "Level1.h"
#import "StartQuiz.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnAbout,btnPlay,btnSetting,btn_aboutoutlet,btn_setting_outlet,lbl_cricketQuiz;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    btn_aboutoutlet.layer.cornerRadius = 8;
    btn_aboutoutlet.layer.borderWidth = 1;
    btn_aboutoutlet.layer.borderColor=[[UIColor colorWithRed:94.0/255.0 green:169.0/255.0 blue:227.0/255.0 alpha:1]CGColor];
    
    btn_setting_outlet.layer.cornerRadius = 8;
    btn_setting_outlet.layer.borderWidth = 1;
    btn_setting_outlet.layer.borderColor=[[UIColor colorWithRed:94.0/255.0 green:169.0/255.0 blue:227.0/255.0 alpha:1]CGColor];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - about button
- (IBAction)btnAbout:(id)sender {

    About * abobj=[[About alloc]initWithNibName:@"About" bundle:nil];
    [self.navigationController pushViewController:abobj animated:YES];

}


#pragma mark - Rotation
-(BOOL)shouldAutorotate{
    return NO;
}




#pragma mark - setting button

- (IBAction)btnSettings:(id)sender {
    Settings * setobj=[[Settings alloc]initWithNibName:@"Settings" bundle:nil];
    [self.navigationController pushViewController:setobj animated:YES];
}

#pragma mark - game play button

- (IBAction)btnPlay:(id)sender {
    Play * playobj=[[Play alloc]initWithNibName:@"Play" bundle:nil];
    [self.navigationController pushViewController:playobj animated:YES];
}
@end

//
//  ViewController.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnPlay;
@property (strong, nonatomic) IBOutlet UIButton *btnSetting;
@property (strong, nonatomic) IBOutlet UIButton *btnAbout;
- (IBAction)btnPlay:(id)sender;

- (IBAction)btnSettings:(id)sender;
- (IBAction)btnAbout:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_aboutoutlet;
@property (strong, nonatomic) IBOutlet UIButton *btn_setting_outlet;
@property (strong, nonatomic) IBOutlet UILabel *lbl_cricketQuiz;

@end


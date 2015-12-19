//
//  Settings.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Settings : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *btnSound;
- (IBAction)Sound:(id)sender;
- (IBAction)btnResetSettingsTapped:(UIButton *)sender;
- (IBAction)btnBackToHomeTapped:(id)sender;

@end

//
//  HighScore.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 28/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScore : UIViewController
- (IBAction)BtnNextLevel:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblMessage;
@property (strong, nonatomic) IBOutlet UILabel *lblScoreMessage;
@property (strong, nonatomic) IBOutlet UILabel *LblScore;

@property (weak, nonatomic) IBOutlet UIButton *btn_done;
- (IBAction)FbshareButton:(id)sender;

@end

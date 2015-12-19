//
//  HighScore.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 28/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "HighScore.h"
#import "Play.h"
#import "StartQuiz.h"
#import "AppDelegate.h"

@interface HighScore ()

@end

@implementation HighScore
@synthesize myImageView,lblStatus,lblMessage,lblScoreMessage,btn_done,LblScore;

- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view from its nib.
    AppDelegate * app=[[UIApplication sharedApplication]delegate];
    LblScore.text=[NSString stringWithFormat:@"You have scored :%d points",app.score];
    
    btn_done.layer.cornerRadius = 8;
    btn_done.layer.borderWidth = 1;
    btn_done.layer.borderColor=[[UIColor colorWithRed:94.0/255.0 green:169.0/255.0 blue:227.0/255.0 alpha:1]CGColor];
    
    
    
    if(app.score>40){
        myImageView.image=[UIImage imageNamed:@"score_pass_icon.png"];
        lblMessage.text=@"Congratulations";
        lblStatus.text=@"YOU WON!";
    
} else{
        myImageView.image=[UIImage imageNamed:@"score_fail_icon.png"];
        lblMessage.text=@"Sorry";
        lblStatus.text=@"YOU LOSS!";
}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button for next level

- (IBAction)BtnNextLevel:(id)sender {
    
    
    AppDelegate * app=[[UIApplication sharedApplication]delegate];
    
    NSLog(@"%d",app.score);
    NSLog(@"High Score for Level 1=%d",app.intLbl1Score);

    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];

    
}
- (IBAction)FbshareButton:(id)sender {
     AppDelegate * app=[[UIApplication sharedApplication]delegate];
    NSString  *shareText=[NSString stringWithFormat:@"My Score in Football Quiz App %d",app.score];
    NSArray *itemsToShare = @[shareText];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes =@[];
    [self presentViewController:activityVC animated:YES completion:nil];
    
    
    
}
@end

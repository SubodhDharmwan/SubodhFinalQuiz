//
//  StartQuiz.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 23/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level1.h"
#import "AppDelegate.h"
#import <sqlite3.h>



//-----------Circuler Progress Bar-----------------------


@class CircleProgressBar;



//-----------Circuler Progress Bar-----------------------

@interface StartQuiz : UIViewController<UIAlertViewDelegate>{
    Level1 *connection;
    AppDelegate *app;
    NSString *databasepath;
   

        NSMutableArray *question;
    NSMutableArray *answer;
    NSMutableArray *option_A;
    NSMutableArray *option_B;
    NSMutableArray *option_C;
    NSMutableArray *option_D;
}
@property (strong, nonatomic) IBOutlet UILabel *lblLevelNumber;

@property (strong, nonatomic) IBOutlet UILabel *lblPercentage;
@property (strong, nonatomic) IBOutlet UILabel *lblQuestionnumber;
@property (strong, nonatomic) IBOutlet UILabel *lblQuestion;
@property (strong, nonatomic) IBOutlet UILabel *lblScore;
@property (strong, nonatomic) IBOutlet UILabel *lblPoints;
@property (strong, nonatomic) IBOutlet UIButton *btnOption1;
@property (strong, nonatomic) IBOutlet UIButton *btnOption2;
@property (strong, nonatomic) IBOutlet UIButton *btnOption3;
@property (strong, nonatomic) IBOutlet UIButton *btnOption4;
@property(strong,nonatomic)NSMutableArray *questionArray;

@property (strong, nonatomic) IBOutlet CircleProgressBar *circleProgressBar;

@property (nonatomic,strong)NSString *comingLbl;
@property (strong, nonatomic) IBOutlet UIImageView *img_background;

- (IBAction)btnBackToHomeTapped:(id)sender;


- (IBAction)btnOption:(id)sender;
@property(nonatomic) sqlite3 *db;






@end

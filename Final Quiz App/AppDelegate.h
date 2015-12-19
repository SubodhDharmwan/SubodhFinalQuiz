//
//  AppDelegate.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic)int level1Score;
@property(nonatomic)int intlevel2Score,intlevel3Score,intlevel4Score,intlevel5Score;
@property(nonatomic)int score;

@property int intLbl1Score;
@property(strong)AVAudioPlayer *audioPlayer;
@property(strong,nonatomic)NSString *score1,*score2,*score3,*score4,*score5;
@property(strong ,nonatomic)NSString *my_level;
@property(nonatomic)int counter;

@end


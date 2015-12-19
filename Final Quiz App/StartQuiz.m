//
//  StartQuiz.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 23/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "StartQuiz.h"
#import "Level1.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "HighScore.h"
#import "CircleProgressBar.h"



@interface StartQuiz (){
    NSUInteger random;
   // int counter;
    sqlite3 *db;
    NSString *sql;
    NSString *level;

}

   
@end

@implementation StartQuiz
@synthesize lblPercentage,lblQuestion,lblQuestionnumber,lblPoints,lblScore,btnOption1,btnOption2,btnOption3,btnOption4,db,lblLevelNumber,img_background;

@synthesize comingLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    img_background.layer.cornerRadius = img_background.frame.size.height /1.94;
    img_background.layer.masksToBounds = YES;
    img_background.layer.borderWidth = 0;
    
    
 // NSLog(@"the score data is   ======%d",app.score);
    
    app=[[UIApplication sharedApplication]delegate];

    [_circleProgressBar setProgress:(_circleProgressBar.progress + 0.01f) animated:YES];

    app.score=0;
   // NSLog(@"comign lbl---%@",comingLbl);
    
    
    
    app.counter=0;
    btnOption1.tag=1;
    btnOption2.tag=2;
    btnOption3.tag=3;
    btnOption4.tag=4;
    
    
   //[self animationOnButton];  // animation method calls
    

    
    question=[NSMutableArray array];
    answer=[NSMutableArray array];
    option_A=[NSMutableArray array];
    option_B=[NSMutableArray array];
    option_C=[NSMutableArray array];
    option_D=[NSMutableArray array];
    connection=[[Level1 alloc]init];
    
    
    
    btnOption1.titleLabel.numberOfLines=3;
    btnOption2.titleLabel.numberOfLines=3;
    btnOption3.titleLabel.numberOfLines=3;
    btnOption4.titleLabel.numberOfLines=3;

    databasepath = [connection checkAndCreateDatabase];
    NSLog(@"the database is %@",databasepath);
    connection = nil;
    
    //=================================================code for selection of level===========================================================
    NSLog(@"%@",app.my_level);
    
    if ([app.my_level isEqualToString:@"0"]) {
        level=[NSString stringWithFormat:@"Level1"];
        lblLevelNumber.text=@"Level 1";
    }
    
    else if ([app.my_level isEqualToString:@"1"]) {
    level=[NSString stringWithFormat:@"Level2"];
        lblLevelNumber.text=@"Level 2";
    
    }
    else if ([app.my_level isEqualToString:@"2"]){
        level=[NSString stringWithFormat:@"Level3"];
        lblLevelNumber.text=@"Level 3";
    }
    else if ([app.my_level isEqualToString:@"3"]){
        level=[NSString stringWithFormat:@"Level4"];
        lblLevelNumber.text=@"Level 4";

    }
    else if ([app.my_level isEqualToString:@"4"]){
        level=[NSString stringWithFormat:@"Level5"];
        lblLevelNumber.text=@"Level 5";

    }
    
    
    
#pragma mark - sqlit database connectivity
    
    
    if (sqlite3_open([databasepath UTF8String], &db) == SQLITE_OK)
    {
        NSString *firstString=@"SELECT * FROM ";
        sql=[firstString stringByAppendingString:level];
      // sql = [NSString stringWithFormat:@"SELECT * FROM Level1"];
        
       // NSLog(@"the query is ::: %@",sql);
        
        sqlite3_stmt *selectstmt;
        const char *sqlQuery =[sql cStringUsingEncoding:NSASCIIStringEncoding];
        
     
        if(sqlite3_prepare_v2(db, sqlQuery, -1, &selectstmt, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(selectstmt) == SQLITE_ROW)
            {
                if( sqlite3_column_text(selectstmt, 0) != NULL)
                {
                    // [QuestionArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,0)]];
                    
                    NSString* str=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,0)];
                    [str componentsSeparatedByString:[NSString stringWithFormat:@"\n"]];
                    //[question addObject:str];
                    
                  //   NSLog(@"heloo--------");
                    
                    [question addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,0)]];
                    
                  //  [lblQuestion ]
                    
                    [answer addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)]];
                    //  NSLog(@"Answer :%@",answer);
                    
                    [option_A addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,2)]];
                    [option_B addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,3)]];
                    [option_C addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,4)]];
                    [option_D addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt,5)]];
                    
                    
                     // NSLog(@"Question: : %@",question);
                    
                    
                    
    
 //=================================================code for Random questions===========================================================
                    
                    
                    
                    random=[question count];
                    random=[answer count];
                    random=[option_A count];
                    random=[option_B count];
                    random=[option_C count];
                    random=[option_D count];
                    
//                    for (int i = 0; i < random; ++i)
//                    {
//                        // Select a random element between i and end of array to swap with.
//                        NSUInteger nElements = random - i;
//                        int n = (arc4random() % nElements) +i;
//                        [question exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        [answer exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        [option_A exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        [option_B exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        [option_C exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        [option_D exchangeObjectAtIndex:i withObjectAtIndex:n];
//                        
                       // NSLog(@"the question array is--======%@",question);
                        
                        
                        lblQuestion.text=[question objectAtIndex:app.counter];
                        [btnOption1 setTitle:[option_A objectAtIndex:app.counter] forState:UIControlStateNormal];
                        [btnOption2 setTitle:[option_B objectAtIndex:app.counter] forState:UIControlStateNormal];
                        [btnOption3 setTitle:[option_C objectAtIndex:app.counter] forState:UIControlStateNormal];
                        [btnOption4 setTitle:[option_D objectAtIndex:app.counter] forState:UIControlStateNormal];
                        
                        
                    }
                   // [self animateQuestion];
                    
                   // NSLog(@"%@",str);
               /// }
                else
                    NSLog(@"hellloooo");
                
                
            }
        }
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Option button

- (IBAction)btnBackToHomeTapped:(id)sender {
    NSArray *array = [self.navigationController viewControllers];
    
    [self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
    
}


- (IBAction)btnOption:(id)sender {
    
    
    
    UIButton * btn=(UIButton *)sender;
    NSInteger tag=btn.tag;
    if (tag==1) {
        
        if([[answer objectAtIndex:app.counter]isEqualToString:[option_A objectAtIndex:app.counter]]){
            app.score+=1;
            lblPoints.text=[NSString stringWithFormat:@"%d", app.score];
            {}
            
            [btnOption1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
            
            
            
            [btnOption1 setUserInteractionEnabled:NO];
           
            double delayInSeconds = 0.3;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self questionChange];

            });

        }
       
        else{
            [btnOption1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

         app.score-=1;
         lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
            [btnOption1 setUserInteractionEnabled:NO];

        }
        
    }
    
   
    if (tag==2) {
        
        if([[answer objectAtIndex:app.counter]isEqualToString:[option_B objectAtIndex:app.counter]]){
            app.score+=1;
            lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
            [btnOption2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            


            double delayInSeconds = 0.3;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self questionChange];
            });
       
            [btnOption2 setUserInteractionEnabled:NO];



        }
        
        else{
            app.score-=1;
            [btnOption2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

            lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
            [btnOption2 setUserInteractionEnabled:NO];

        }
        
    }
    if (tag==3) {
        
        if([[answer objectAtIndex:app.counter]isEqualToString:[option_C objectAtIndex:app.counter]]){
            app.score+=1;
            lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
            [btnOption3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];


            double delayInSeconds = 0.3;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self questionChange];
            });
            
            
            [btnOption2 setUserInteractionEnabled:NO];



        }
        
        else{
             app.score-=1;
            lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
            [btnOption3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [btnOption3 setUserInteractionEnabled:NO];


        }

    }
        
        if (tag==4) {
            
            if([[answer objectAtIndex:app.counter]isEqualToString:[option_D objectAtIndex:app.counter]]){
                app.score+=1;
                lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
                [btnOption4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

                double delayInSeconds = 0.3;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [self questionChange];
                });

                [btnOption4 setUserInteractionEnabled:NO];


            }
            
            else{
                
                app.score-=1;
                lblPoints.text=[NSString stringWithFormat:@"%d",app.score];
                [btnOption4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [btnOption4 setUserInteractionEnabled:NO];


                
                
            }
           
            
    }
    
    }


#pragma mark - Question change


-(void)questionChange{
    
    
    if(app.counter>=49){
        
       
        
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Quiz /complete" message:@"You completed the level" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    } else{
        [btnOption1 setUserInteractionEnabled:YES];
        [btnOption2 setUserInteractionEnabled:YES];
        [btnOption3 setUserInteractionEnabled:YES];
        [btnOption4 setUserInteractionEnabled:YES];
       
        [_circleProgressBar setProgress:(_circleProgressBar.progress + 0.02f) animated:YES];

        app.counter+=1;
        
        [btnOption1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btnOption2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btnOption3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btnOption4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
      
        lblPercentage.text=[NSString stringWithFormat:@"%d/50",app.counter+1];
        lblQuestion.text=[question objectAtIndex:app.counter];
        [btnOption1 setTitle:[option_A objectAtIndex:app.counter] forState:UIControlStateNormal];
        [btnOption2 setTitle:[option_B objectAtIndex:app.counter]forState:UIControlStateNormal];
        [btnOption3 setTitle:[option_C objectAtIndex:app.counter] forState:UIControlStateNormal];
        [btnOption4 setTitle:[option_D objectAtIndex:app.counter]forState:UIControlStateNormal];
        
        
    }
}

#pragma mark - alert for score change in levels

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        
        if ([app.my_level isEqualToString:@"0"]) {
            
            app.intLbl1Score=app.score;
             [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intLbl1Score]forKey:@"app.intLbl1Score"];
            
        }else if ([app.my_level isEqualToString:@"1"]){
            
            app.intlevel2Score=app.score;
            [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel2Score] forKey:@"app.intlevel2Score"];
            
        }else if ([app.my_level isEqualToString:@"2"]){
            
            app.intlevel3Score=app.score;
            [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel3Score] forKey:@"app.intlevel3Score"];
            
        }else if ([app.my_level isEqualToString:@"3"]){
            
            app.intlevel4Score=app.score;
            [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel4Score] forKey:@"app.intlevel4Score"];
            
        }else if ([app.my_level isEqualToString:@"4"]){
            
            app.intlevel5Score=app.score;
            [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel5Score] forKey:@"app.intlevel5Score"];
                   }
        
//        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intLbl1Score]forKey:@"app.intLbl1Score"];
//        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel2Score] forKey:@"app.intlevel2Score"];
//        NSLog(@"socre 1----------------%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]);
//        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel3Score] forKey:@"app.intlevel3Score"];
//        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel4Score] forKey:@"app.intlevel4Score"];
//        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",app.intlevel5Score] forKey:@"app.intlevel5Score"];
        
        
        
        
        HighScore * highobj=[[HighScore alloc]initWithNibName:@"HighScore" bundle:nil];
        [self.navigationController pushViewController:highobj animated:YES];
        
        
        
    }
}

#pragma mark - animation on buttons

//-(void)animationOnButton{
//    
//    
//    CGPoint newLeftCenter = CGPointMake( 64.0f + btnOption1.frame.size.width / 2.0f, btnOption1.center.y);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    btnOption1.center = newLeftCenter;
//    [UIView commitAnimations];
//    
//    CGPoint newLeft = CGPointMake( 128.0f + btnOption2.frame.size.width / 1.0f, btnOption2.center.y);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    btnOption2.center = newLeft;
//    [UIView commitAnimations];
//    
//    
//    CGPoint new = CGPointMake( 64.0f + btnOption3.frame.size.width / 2.0f, btnOption3.center.y);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    btnOption3.center = new;
//    [UIView commitAnimations];
//    
//    
//    CGPoint newl = CGPointMake( 128.0f + btnOption4.frame.size.width / 1.0f, btnOption4.center.y);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    btnOption4.center = newl;
//    [UIView commitAnimations];
//    
//
//}

@end








//
//  Play.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "Play.h"
#import "CustomCell.h"
#import "Level1.h"
#import "StartQuiz.h"
#import "AppDelegate.h"
#import "Settings.h"

@interface Play (){
    NSArray * tabledata;
    CustomCell * cell;
    AppDelegate *app;
}

@end

@implementation Play
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [myTableView setScrollEnabled:NO];
    //----------------------------------------------------Quiz app catagories-----------------------------------------
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    tabledata=[NSArray arrayWithObjects:@"Level1",@"Level2",@"Level3",@"Level4",@"Level5", nil];
  //  NSLog(@"55555555%d",[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]intValue]);
    
    //----------------------------------------------------Disable the progress bar-----------------------------------------
    
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    app=[[UIApplication sharedApplication]delegate];
    [myTableView reloadData];     //-----Table Reload------------
    
    NSLog(@"Counter value %d",app.counter);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

#pragma mark - tableview


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tabledata count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellIdentity=@"cell";
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(cell==nil){
        NSArray * tableArray=[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil];
        cell=[tableArray objectAtIndex:0];
        
    }
    
    cell.lblLevel.text=[tabledata objectAtIndex:indexPath.row];
   
    
    if (indexPath.row==0) {
        
        
        if([[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]intValue]>1)
        {

            [cell.progressView setTransform:CGAffineTransformMakeScale(1.0, 3.0)];
            cell.progressView.progress=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]floatValue]/50.0;
            float value=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]floatValue]/50.0;
            int percentage=value*100;
            cell.lbl_percentage.text=[NSString stringWithFormat:@"%d %%",percentage];
        
        } else{
           
            cell.progressView.hidden=YES;
            cell.lbl_percentage.hidden=YES;
            
        }
        
    }else if (indexPath.row==1){
        
        if([[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]intValue]>=40)
        {
            cell.myImageView.image=[UIImage imageNamed:nil];
            [cell.progressView setTransform:CGAffineTransformMakeScale(1.0, 3.0)];
            cell.progressView.progress=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel2Score"]floatValue]/50.0;
            float value=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel2Score"]floatValue]/50.0;
            int percentage=value*100;
            cell.lbl_percentage.text=[NSString stringWithFormat:@"%d %%",percentage];
            
        } else{
            cell.myImageView.image=[UIImage imageNamed:@"football_lock_icon.png"];
            cell.progressView.hidden=YES;
            cell.lbl_percentage.hidden=YES;
            
        }
        
    }else if (indexPath.row==2){
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel2Score"]intValue]>=40) {
           //  cell.myImageView.image=[UIImage imageNamed:@"football_unlock_icon.png"];
            [cell.progressView setTransform:CGAffineTransformMakeScale(1.0, 3.0)];
            cell.progressView.progress=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel3Score"]floatValue]/50.0;
            float value=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel3Score"]floatValue]/50.0;
            int percentage=value*100;
            cell.lbl_percentage.text=[NSString stringWithFormat:@"%d %%",percentage];
            
        } else{
            cell.myImageView.image=[UIImage imageNamed:@"football_lock_icon.png"];
            cell.progressView.hidden=YES;
            cell.lbl_percentage.hidden=YES;
        }
    }
    
    else if (indexPath.row==3){
        
       // cell.lblScore.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"];
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel3Score"]intValue]>=40) {
       // cell.myImageView.image=[UIImage imageNamed:@"football_unlock_icon.png"];
            [cell.progressView setTransform:CGAffineTransformMakeScale(1.0, 3.0)];
            cell.progressView.progress=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"]floatValue]/50.0;
            float value=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"]floatValue]/50.0;
            int percentage=value*100;
            
            cell.lbl_percentage.text=[NSString stringWithFormat:@"%d %%",percentage];

            
        } else{
            cell.myImageView.image=[UIImage imageNamed:@"football_lock_icon.png"];
            cell.progressView.hidden=YES;
            cell.lbl_percentage.hidden=YES;
        }
    }
    
    else if (indexPath.row==4){
        //cell.lblScore.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel5Score"];
       
        
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"]intValue]>=40) {
            //cell.myImageView.image=[UIImage imageNamed:@"football_unlock_icon.png"];
            [cell.progressView setTransform:CGAffineTransformMakeScale(1.0, 3.0)];
            cell.progressView.progress=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel5Score"]floatValue]/50.0;
            float value=[[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel5Score"]floatValue]/50.0;
            int percentage=value*100;
            
            cell.lbl_percentage.text=[NSString stringWithFormat:@"%d %%",percentage];
            
        } else{
            cell.myImageView.image=[UIImage imageNamed:@"football_lock_icon.png"];
            cell.progressView.hidden=YES;
            cell.lbl_percentage.hidden=YES;
        }
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGSize size = [[UIScreen mainScreen]bounds].size;
    if (size.height==480) {
           return 60;
    }
    else if (size.height==568) {
        return 82;
    }
    else if (size.height==667) {
        return 92;
    }
    else if (size.height==736) {
        return 102;
    }

    else  {
        return 180;
    }
    
}



//----------------------------------------------Level selection-------------------------------------------------



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *tappedIndex;
    
   //StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
    
   tappedIndex =[NSString stringWithFormat:@"%lu",(long)indexPath.row];
    
    NSLog(@"tapped index %@",tappedIndex);
    
    //level1obj.comingLbl=tappedIndex;
    
    if ([tappedIndex isEqualToString:@"0"]) {
        app.my_level=@"0";
        NSLog(@"my lewvel %@" , app.my_level);
    }
    else if ([tappedIndex isEqualToString:@"1"]) {
        app.my_level=@"1";
    }
    else if ([tappedIndex isEqualToString:@"2"]) {
        app.my_level=@"2";
    }
    else if ([tappedIndex isEqualToString:@"3"]){
       app.my_level=@"3";
    }
    else if ([tappedIndex isEqualToString:@"4"]) {
        app.my_level=@"4";
    }
    
    if ([tappedIndex isEqualToString:@"0"] || [tappedIndex isEqualToString:@"1"] || [tappedIndex isEqualToString:@"2"] ||   [tappedIndex isEqualToString:@"3"]|| [tappedIndex isEqualToString:@"4"]) {
        
        if ([tappedIndex isEqualToString:@"1"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]intValue] <=40) {
           
            
            [self alertShow:@"You can not play Level-2,Leve-1's Score is less than 70."];
            
            
        } else if(([tappedIndex isEqualToString:@"1"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intLbl1Score"]intValue]>=40)){
            
            CGSize size = [[UIScreen mainScreen]bounds].size;
            
            if (size.height==480) {
               StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
               [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==568) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone5s" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }

            else if (size.height==667) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone6" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==736) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipnone6plus" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else{
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipad" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
           // [self.navigationController pushViewController:level1obj animated:YES];
        }
        
        if ([tappedIndex isEqualToString:@"2"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel2Score"]intValue] <=40) {
            
            [self alertShow:@"You can not play Level-3,Level-2's Score is less than 70."];
            
        } else if(([tappedIndex isEqualToString:@"2"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel2Score"]intValue]>=40)){
            
            CGSize size = [[UIScreen mainScreen]bounds].size;
            
            if (size.height==480) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==568) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone5s" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            else if (size.height==667) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone6" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==736) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipnone6plus" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }

            else{
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipad" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            
            //[self.navigationController pushViewController:level1obj animated:YES];
            
            
        }
        
        if ([tappedIndex isEqualToString:@"3"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel3Score"]intValue] <=40) {
            
            [self alertShow:@"You can not play Level-4,Level-3's Score is less than 70."];
            
            
        } else if(([tappedIndex isEqualToString:@"3"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel3Score"]intValue]>=40)){
            
            CGSize size = [[UIScreen mainScreen]bounds].size;
            
            if (size.height==480) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==568) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone5s" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            else if (size.height==667) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone6" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==736) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipnone6plus" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else{
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipad" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            

            // [self.navigationController pushViewController:level1obj animated:YES];
            
            
        }
        
        if ([tappedIndex isEqualToString:@"4"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"]intValue] <=40) {
            
            [self alertShow:@"You can not play Level-5,Level-4's Score is less than 70."];
            
            
        } else if(([tappedIndex isEqualToString:@"4"] && [[[NSUserDefaults standardUserDefaults] valueForKey:@"app.intlevel4Score"]intValue]>=40)){
            
            CGSize size = [[UIScreen mainScreen]bounds].size;
            
            if (size.height==480) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==568) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone5s" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            else if (size.height==667) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone6" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==736) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipnone6plus" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }

            else{
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipad" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            
            //[self.navigationController pushViewController:level1obj animated:YES];
            
            
        } else if ([tappedIndex isEqualToString:@"0"]){
            CGSize size = [[UIScreen mainScreen]bounds].size;
            
            if (size.height==480) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"StartQuiz" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==568) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone5s" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
            else if (size.height==667) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_iphone6" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            else if (size.height==736) {
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipnone6plus" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }

            else{
                StartQuiz * level1obj=[[StartQuiz alloc]initWithNibName:@"start_ipad" bundle:nil];
                [self.navigationController pushViewController:level1obj animated:YES];
            }
            
           // [self.navigationController pushViewController:level1obj animated:YES];
            
        }
    }
   
}

#pragma mark - alertview
-(void)alertShow: (NSString*)message{
    
    UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"Message" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alr show];
}


- (IBAction)btnBackToHomeTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)btnSettingTapped:(id)sender {
    Settings * setobj=[[Settings alloc]initWithNibName:@"Settings" bundle:nil];
    [self.navigationController pushViewController:setobj animated:YES];

}
@end

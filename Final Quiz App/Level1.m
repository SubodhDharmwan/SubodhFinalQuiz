//
//  Level1.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 23/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "Level1.h"
#import "StartQuiz.h"
#import "ViewController.h"
#import "Play.h"


@implementation Level1


static Level1 *sharedInstance=nil;

@synthesize databasePath;




+(Level1*)getsharedInstance {
    
    
    if (!sharedInstance) {
        sharedInstance=[[super allocWithZone:NULL]init];
        [sharedInstance createDatabase];
    }
    return sharedInstance;
}

#pragma mark - create database
-(void)createDatabase
{
    
    
    NSString *docsDir;
    NSArray *dirPath;
    
    
    
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    databasePath =[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"Cricket  Quiz app.sqlite"]];

    NSLog(@"DATA BASE CREATED===========%@",databasePath);
    
}


-(NSString *)checkAndCreateDatabase{
    
    [self createDatabase];
    
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:databasePath];
    
    if(success){
        
        return databasePath;
    } else{
        
        NSLog(@"File does not exist!!");
    }
    
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Cricket  Quiz app.sqlite"];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    return databasePath;
    
}


@end

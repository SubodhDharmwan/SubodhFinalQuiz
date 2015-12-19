//
//  Level1.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 23/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Level1 : NSObject

@property(nonatomic,strong) NSString *databasePath;

+(Level1 *)getsharedInstance;


-(void)createDatabase;
-(NSString *)checkAndCreateDatabase ;




@end

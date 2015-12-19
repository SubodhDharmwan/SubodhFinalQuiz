//
//  Play.h
//  Final Quiz App 
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Play : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)btnBackToHomeTapped:(id)sender;
- (IBAction)btnSettingTapped:(id)sender;

@end

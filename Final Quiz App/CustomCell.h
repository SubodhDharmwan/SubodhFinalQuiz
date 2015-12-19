//
//  CustomCell.h
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 21/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblLevel;


//@property (strong, nonatomic) IBOutlet UILabel *lblScore;


@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UILabel *lbl_percentage;


@end

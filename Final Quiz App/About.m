//
//  About.m
//  Final Quiz App
//
//  Created by Subodh Dharmwan on 16/09/15.
//  Copyright (c) 2015 abc. All rights reserved.
//

#import "About.h"
#import "Level1.h"

@interface About ()

@end

@implementation About
@synthesize AboutTextView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//--------------------Back to Home------------------------------

#pragma mark - Cynoteck URL

- (IBAction)btnCynoteckURL:(id)sender {
    
    
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.cynoteck.com/" ];
    [[UIApplication sharedApplication] openURL:url];
}
#pragma mark - back button
- (IBAction)btnBackTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}




@end

//
//  ResultantTextEntryViewController.m
//  Training4
//
//  Created by sanjana sripathi on 08/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "ResultantTextEntryViewController.h"

@interface ResultantTextEntryViewController ()

@end

@implementation ResultantTextEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setOutputLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setOutputLabel
{
    outputLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, 300, 300)];
    [outputLabel setText:@"Thank you for taking interest and submitting the view. This was just to see your interest in government of this country. I appreciate your interest. Jai Hind! "];
    [outputLabel setNumberOfLines:5];
    [outputLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.view addSubview:outputLabel];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

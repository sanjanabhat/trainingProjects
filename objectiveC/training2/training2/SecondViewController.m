//
//  SecondViewController.m
//  training2
//
//  Created by sanjana sripathi on 06/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "SecondViewController.h"
#import "MainViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addNavigationButton];
    [self outputToLabel];
}
-(void) viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBar.barTintColor=[UIColor yellowColor];
    self.navigationController.navigationBar.barTintColor=[UIColor yellowColor];
    
}

-(void)outputToLabel
{
    outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 40)];
    [outputLabel setText:[NSString stringWithFormat:@"%@",_successMessage]];
    [outputLabel setTextColor:[UIColor redColor]];
    [self.view addSubview:outputLabel];
                   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addNavigationButton
{
    //[ [UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    //UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(setCancelButton)];
   // [cancel setTintColor:[UIColor whiteColor]];
    //[self.navigationItem setRightBarButtonItem:cancel];
                               
}
-(void)setCancelButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

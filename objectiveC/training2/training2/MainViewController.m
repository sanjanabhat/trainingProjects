//
//  MainViewController.m
//  training2
//
//  Created by sanjana sripathi on 06/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setScreen];
    [self setUserList];
    [self addNavigationBarButton];
    
}
-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor=[UIColor greenColor];

}
-(void) viewDidAppear:(BOOL)animated
{
    [name setText:NULL];
    [password setText:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setScreen
{
    UIImage *image = [UIImage imageNamed:@"BackgroundImage.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    welcome = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 400, 70)];
    [welcome setText:@"WELCOME!!"];
    [welcome setFont:[UIFont fontWithName:@"Menlo" size:70]];
    [welcome setTextColor:[UIColor blueColor]];
    [self.view addSubview:welcome];
}

-(void)setUserList
{
    NSArray *users = [[NSArray alloc] initWithObjects:@"Sanjana",@"Shri" ,nil];
    NSArray *passwords = [[NSArray alloc] initWithObjects:@"Sanjana",@"shri", nil];
    userList = [[NSDictionary alloc] initWithObjects:users forKeys:passwords];
}

-(void)expandSignIn:(id)sender
{
    [signIn setHidden:!signIn.hidden];
    [name setHidden:!name.hidden];
    [password setHidden:!password.hidden];
    [password setText:NULL];
    [welcome setText:NULL];
}


-(void)addNavigationBarButton
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    UIImage *barButtonImage = [UIImage imageNamed:@"button_tap_selected.png"];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [button setBackgroundImage:barButtonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(expandSignIn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *signInButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:signInButton];
       
    self.navigationItem.title = @"MyApplication" ;
    
    signIn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signIn setTitle:@"Sign In" forState:UIControlStateNormal];
    [signIn setFrame:CGRectMake(20, 200, 50, 20) ];
    [signIn addTarget:self action:@selector(setSignInAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signIn];
    [signIn setHidden:YES];
    
    name = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 300, 40)];
    [name setPlaceholder:@"UserName"];
    [name setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:name];
    [name setHidden:YES];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 300, 40)];
    [password setPlaceholder:@"Password"];
    [password setBorderStyle:UITextBorderStyleRoundedRect];
    [password setSecureTextEntry:YES];
    [self.view addSubview:password];
    [password setHidden:YES];
    

}


-(void)setSignInAction:(id)sender
{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    //UINavigationController *navigationForSecondController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];

    NSString *nameValue = name.text;
    NSString *passwordValue = password.text;
    if([passwordValue isEqualToString:[userList valueForKey:nameValue]]){
       secondViewController.successMessage = [[NSString alloc]initWithFormat: @"Successfully Logged in"];
        
    }
    else
    {
         secondViewController.successMessage = @"Login Failed";
    }
    
  //  navigationForSecondController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:secondViewController animated:YES];
  // [self presentViewController:navigationForSecondController animated:YES completion:nil];

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

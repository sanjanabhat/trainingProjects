//
//  TextEntryViewController.m
//  Training4
//
//  Created by sanjana sripathi on 08/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "TextEntryViewController.h"

@interface TextEntryViewController ()

@end

@implementation TextEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addLabel];
    [self addTextField];
    [self addEmail];
    [self addPhoneNumber];
    [self addTextView];
    [self addButton];
    [self infoOnViews];
    
   
}
-(void)viewWillAppear:(BOOL)animated
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard) ];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) hideKeyboard
{
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
    [self.textFieldNumber resignFirstResponder];
    [self.textFieldEmail resignFirstResponder];
}
-(void) addLabel
{
    label = [[UILabel alloc] initWithFrame : CGRectMake(160, 50, 300, 70)];
    [label setText:@"Welcome"];
    [label setFont:[UIFont fontWithName:@"American Typewriter" size:30]];
    [label setTextColor :[UIColor blueColor]];
    [self.view addSubview:label];
    
}

-(void)addTextField
{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 300, 40)];
    [self.textField setPlaceholder:@"Your Name Please" ];
    [self.textField setFont:[UIFont fontWithName:@"Calibri" size:20]];
    [self.textField setBorderStyle:UITextBorderStyleBezel];
    [self.textField setTextAlignment:NSTextAlignmentCenter];
    [self.textField setDelegate:self];
    [self.textField setValue:[UIColor redColor]  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:self.textField];
                 
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self enablingTheButton];
    return YES;
}
 -(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
   [self enablingTheButton];
    return YES;

}


-(void) enablingTheButton
{
    if (!([self.textView.text isEqualToString:@""] || self.textField.text.length==0 || self.textFieldEmail.text.length==0 || self.textFieldNumber.text.length==0))
    {
        [ submitButton setEnabled:YES];
    }
    else
    {
        [submitButton setEnabled:NO];
    }
    

}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self enablingTheButton];
    if([string isEqualToString:@"\n"])
     {
     [self.textField resignFirstResponder];
     }
 
    return YES;
    
}

-(void)addEmail
{
    self.textFieldEmail = [[UITextField alloc]initWithFrame:CGRectMake(20, 200, 300, 40)];
    [self.textFieldEmail setPlaceholder:@"Email"];
    [self.textFieldEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    [self.textFieldEmail setFont:[UIFont fontWithName:@"Calibri" size:20]];
    [self.textFieldEmail setBorderStyle:UITextBorderStyleBezel];
    [self.textFieldEmail setTextAlignment:NSTextAlignmentCenter];
    [self.textFieldEmail setDelegate:self];
    [self.textFieldEmail setValue:[UIColor redColor]  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:self.textFieldEmail];
}

-(void)addPhoneNumber
{
    self.textFieldNumber = [[UITextField alloc] initWithFrame:CGRectMake(20, 250, 300, 40)];
    [self.textFieldNumber setPlaceholder:@"Phone number"];
    [self.textFieldNumber setFont:[UIFont fontWithName:@"Calibri" size:20]];
    [self.textFieldNumber setBorderStyle:UITextBorderStyleBezel];
    [self.textFieldNumber setTextAlignment:NSTextAlignmentCenter];
    [self.textFieldNumber setKeyboardType:UIKeyboardTypePhonePad];
    [self.textFieldNumber setDelegate:self];
    [self.textFieldNumber setValue:[UIColor redColor]  forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:self.textFieldNumber];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void) addTextView
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 300, 300, 100)];
    placeholderString = @"Enter your Views on Modi";
    [self.textView setText : placeholderString];
    [self.textView setTextColor:[UIColor redColor]];
    [self.textView setTextAlignment:NSTextAlignmentCenter];

    [[self.textView layer] setBorderColor :[[UIColor grayColor] CGColor ]];
    [[self.textView layer] setBorderWidth:1.0];
    [[self.textView layer] setCornerRadius:1];
    [self.textView resignFirstResponder];
    [self.textView setFont:[UIFont fontWithName:@"American Typewriter" size:30]];
    [self.textView setDelegate:self];
    [self.textView setScrollEnabled:YES];
    [self.view addSubview:self.textView];
    
    
}

-(void) textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:placeholderString])
    {
        [textView setText:@""];
        [textView setTextColor:[UIColor blackColor]];
       [ submitButton setEnabled:NO];
    }
    else
    {
    [self enablingTheButton];
    }

}

-(void) textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""])
    {
        [textView setText: placeholderString];
        [textView setTextColor:[UIColor redColor]];
        [textView setTextAlignment:NSTextAlignmentCenter];
        [ submitButton setEnabled:NO];
    }
    else
    {
     [self enablingTheButton];
    }
    
   
}

-(void) textViewDidChange:(UITextView *)textView
{
    [self enablingTheButton];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]){
        [self.textView resignFirstResponder];
    }
    return YES;
}

-(void) addButton
{
    submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.layer.cornerRadius = 5.f;
    submitButton.layer.borderColor = [[UIColor blackColor] CGColor];
    submitButton.layer.borderWidth = 2;
    [submitButton setTitle:@"Submit View" forState:UIControlStateNormal];
    [submitButton setBackgroundColor:[UIColor blueColor]];
    [submitButton setTintColor:[UIColor whiteColor]];
    [submitButton addTarget:self action:@selector(setSubmitButton) forControlEvents:UIControlEventTouchUpInside];
    [submitButton setFrame:CGRectMake(50, 420, 200, 70)];
    [submitButton setEnabled:NO];
    [self.view addSubview:submitButton];
}

-(void) setSubmitButton
{
    ResultantTextEntryViewController *secondController = [[ResultantTextEntryViewController alloc] initWithNibName:@"ResultantTextEntryViewController" bundle:nil];
    [self.navigationController pushViewController:secondController animated:YES];
                                                          
}

-(void) infoOnViews
{
    CGFloat windowWidth = self.view.frame.size.width;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat labelWidth = label.frame.size.width;
    CGFloat labelHeight = label.frame.size.height;
    CGFloat textFieldWidth = self.textField.frame.size.width;
    CGFloat textFieldHeight = self.textField.frame.size.height;
    CGFloat textViewWidth = self.textView.frame.size.width;
    CGFloat textViewHeight = self.textView.frame.size.height;
    NSLog(@"width of window %f and height of window %f",windowWidth,windowHeight);
    NSLog(@"width of Label %f and height of Label %f",labelWidth,labelHeight);
    NSLog(@"width of TextField %f and height of TextField %f",textFieldWidth,textFieldHeight);
    NSLog(@"width of TextView %f and height of TextView %f",textViewWidth,textViewHeight);
    
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

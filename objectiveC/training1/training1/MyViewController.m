//
//  MyViewController.m
//  training1
//
//  Created by sanjana sripathi on 01/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *wordTextView;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (weak, nonatomic) IBOutlet UILabel *WordsLabel;

@end

@implementation MyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender
{
    givenWord=_wordTextView.text;
    sortedGivenWord = [self sortString:givenWord];
     self.WordsLabel.text = [NSString stringWithFormat:@"%@",sortedGivenWord];
    
    [self compareWordsFromFile];
    
}

//To sort a given string
-(NSString*) sortString:(NSString*) givenString
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for(int i = 0;i < givenString.length;i++)
    {
        [array addObject:[NSString stringWithFormat:@"%c",[givenString characterAtIndex:i]]];
        
    }
    NSString *sortedString = [[array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] componentsJoinedByString:@""];
    return sortedString;
    
}

//To compare words from file.
-(void)compareWordsFromFile
{
    setOfMatchedStrings=[[NSMutableArray alloc] init];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding: NSUTF8StringEncoding error:NULL];
    
    
    for(NSString *word in [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]])
    {
        NSString *sortedWord=[self sortString:word];
        if([sortedWord isEqualToString:sortedGivenWord]){
           
            [setOfMatchedStrings addObject:[NSString stringWithFormat:@"%@",word] ];

            
        }
    }
    if(setOfMatchedStrings.count == 0){
       _WordsLabel.text = @"OOPS! Word not in dictionary";
    }
    else
    {
        [self outputContents];
    }
    
}


-(void)outputContents
{
    NSLog(@"%lu",(unsigned long)setOfMatchedStrings.count);
    NSString *string = setOfMatchedStrings[0];;
    NSString *stringConcatenated;
    for(int i = 1 ; i < setOfMatchedStrings.count ; i++){
        stringConcatenated = [NSString stringWithFormat:@"%@",string];
        string = [stringConcatenated stringByAppendingString: [NSString stringWithFormat:@"   %@",setOfMatchedStrings[i]]];
        
    }
    self.WordsLabel.text = [NSString stringWithFormat:@"%@",string];
    

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

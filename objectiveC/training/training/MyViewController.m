//
//  MyViewController.m
//  training
//
//  Created by sanjana sripathi on 30/08/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickButton;


@end

@implementation MyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    buttonPlayer = [self setUpAudio:@"ButtonTap" type:@"wav"];
    timePlayer = [self setUpAudio:@"SecondBeep" type:@"wav"];
    gamePlayer = [self setUpAudio:@"HallOfTheMountainKing" type:@"mp3"];

    cutSeconds=30;
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goBackground)name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goForeground)name:UIApplicationDidBecomeActiveNotification object:nil];
   
    
}

-(AVAudioPlayer*) setUpAudio:(NSString*)file type:(NSString*)type
{
    NSString *path = [[NSBundle mainBundle]pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;

    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:& error];
    if(!audioPlayer){
        NSLog(@"Wrong file");
    }
    return audioPlayer;
}
- (void)resetTheGame
{
    cutSeconds = 0;
    [self setGame];
}

- (IBAction)clickButton:(id)sender
{
    count++;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %i",count];
    [buttonPlayer play];
}

-(void)setTime
{
    seconds--;
    self.timerLabel.text = [NSString stringWithFormat:@"Time %i",seconds];
    [timePlayer play];
    if(seconds == 0){
        [timer invalidate];
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Game Over" message:[NSString stringWithFormat:@"Your score is %i", count] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
            [self resetTheGame];
        }];
        UIAlertAction *exitAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
           _clickButton.enabled = false;
            [alertView dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertView addAction:defaultAction];
        [alertView addAction:exitAction];
        [self presentViewController:alertView animated:YES completion:nil];
        
    }
}

- (void) goBackground
{
    cutSeconds=seconds;
    [timer invalidate], timer = nil;
    
}

- (void) goForeground
{
    seconds=cutSeconds;
    [self setGame];
}

-(void)setGame
{
    count = 0;
    seconds = cutSeconds;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %i",count];
    self.timerLabel.text = [NSString stringWithFormat:@"Time %i",seconds];

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(setTime) userInfo:nil repeats:YES];
    [gamePlayer setVolume:0.3];
    [gamePlayer play];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

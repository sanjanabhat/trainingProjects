//
//  MyViewController.h
//  training
//
//  Created by sanjana sripathi on 30/08/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MyViewController : UIViewController{

    int count;
    int seconds;
    int cutSeconds;
    AVAudioPlayer *buttonPlayer;
    AVAudioPlayer *timePlayer;
    AVAudioPlayer *gamePlayer;

    NSTimer *timer;
}
@end

//
//  AppDelegate.h
//  training2
//
//  Created by sanjana sripathi on 06/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) MainViewController *viewController;
@property(strong, nonatomic) UINavigationController *navController;


@end


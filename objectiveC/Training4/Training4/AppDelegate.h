//
//  AppDelegate.h
//  Training4
//
//  Created by sanjana sripathi on 08/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextEntryViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navController;
@property (strong,nonatomic) TextEntryViewController *viewController;

@end


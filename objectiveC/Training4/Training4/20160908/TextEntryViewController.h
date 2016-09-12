//
//  TextEntryViewController.h
//  Training4
//
//  Created by sanjana sripathi on 08/09/16.
//  Copyright © 2016 sanjana sripathi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultantTextEntryViewController.h"

@interface TextEntryViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate>
{
 UILabel *label;
NSString *placeholderString;

UIButton *submitButton;
}
@property UITextView *textView;
@property UITextField *textField;
@property UITextField *textFieldEmail;
@property UITextField *textFieldNumber;
//@property(strong,nonatomic)  NSAttributedString *placeholderString;
@end

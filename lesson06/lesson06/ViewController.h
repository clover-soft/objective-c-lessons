//
//  ViewController.h
//  lesson06
//
//  Created by yakov on 25.01.2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UITextField *robotNameField;
@property (strong, nonatomic) UITextField *coordinateXField;
@property (strong, nonatomic) UITextField *coordinateYField;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UIButton *readFromFileButton;
@property (strong, nonatomic) UIButton *writeToFileButton;
@property (strong, nonatomic) UIButton *readFromUserDefaultsButton;
@property (strong, nonatomic) UIButton *writeToUserDefaultsButton;

@end

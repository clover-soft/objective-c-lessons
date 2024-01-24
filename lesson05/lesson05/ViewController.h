//
//  ViewController.h
//  lesson05
//
//  Created by yakov on 23.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) Loader *loader;
- (instancetype)initWithLoader: (Loader *) loader;

@end

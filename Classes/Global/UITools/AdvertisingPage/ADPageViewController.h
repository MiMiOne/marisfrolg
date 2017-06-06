//
//  ADPageViewController.h
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^blockJumpMainViewController)();
@interface ADPageViewController : UIViewController
@property(nonatomic,copy)blockJumpMainViewController blockMainViewController;

@end

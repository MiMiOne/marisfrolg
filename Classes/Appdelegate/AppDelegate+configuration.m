//
//  AppDelegate+configuration.m
//  Template
//
//  Created by Wiley on 2017/6/1.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "AppDelegate+configuration.h"
#import "ADPageViewController.h"
#import "MainTabBarController.h"
@implementation AppDelegate (configuration)
-(void)configurationBase
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ADPageViewController *vc = [[ADPageViewController alloc]init];
    self.window.rootViewController = vc;
    LWWeakSelf(self)
    vc.blockMainViewController = ^{
        weakself.window.rootViewController = [MainTabBarController new];
    };
    
    [self.window makeKeyAndVisible];
}
@end

//
//  MainNavigationController.m
//  Marisfrolg
//
//  Created by Wiley on 2017/6/5.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController
+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    bar.barTintColor = LWRGBColor(206, 166, 106);
    UIImage *image = [UIImage imageNamed:@"Rectangle.png"];
    [bar setBackgroundImage:image forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[UIImage new]];
    
    bar.translucent = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *btn = [[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"u10425.png"] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
//        [btn setTintColor:LWRGBColor(206, 166, 106)];
        [btn setTitle:@"返回" forState:(UIControlStateNormal)];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
        btn.frame = CGRectMake(0, 0, 70, 30);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    [super pushViewController:viewController animated:animated];

}
-(void)back{
    [self popViewControllerAnimated:YES];
}
@end

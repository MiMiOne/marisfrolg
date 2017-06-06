//
//  MainTabBarController.m
//  Marisfrolg
//
//  Created by Wiley on 2017/6/5.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "OrderViewController.h"
#import "MyTableViewController.h"
#import "MainNavigationController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = LWRGBColor(206, 166, 106);
    dic[NSBackgroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:dic forState:(UIControlStateSelected)];
    
    [self.tabBar setClipsToBounds:YES];
//    [self.tabBar insertSubview:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Rectangletb.png"]] atIndex:0];
//    self.tabBar.opaque = YES;
    [self.tabBar setTintColor:LWRGBColor(206, 166, 106)];
    [self setupChildVC];
    
    
}
-(void)setupChildVC{
    [self setupChlidViewController:[[HomeViewController alloc]init] title:@"首页" imageName:@"Grid.png" selectImageName:@"Gridse.png"];
    [self setupChlidViewController:[[NewsViewController  alloc]init] title:@"上新" imageName:@"Refresh.png" selectImageName:@"Refreshse.png"];
    [self setupChlidViewController:[[OrderViewController alloc]init] title:@"订单" imageName:@"Bag.png" selectImageName:@"Bagse.png"];
    [self setupChlidViewController:[[MyTableViewController alloc]init] title:@"我的" imageName:@"Avatar.png" selectImageName:@"Avatarse.png"];
    
//    [self setValue:[[MainTabBar alloc]init] forKey:@"tabBar"];
}
-(void)setupChlidViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)image selectImageName:(NSString *)selectImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
   MainNavigationController* mainNav =  [[MainNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:mainNav] ;

    
}

@end

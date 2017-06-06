//
//  HomeViewController.m
//  Template
//
//  Created by Wiley on 2017/6/1.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "HomeViewController.h"
#import "ShufflingView.h"
@interface HomeViewController ()<UIScrollViewDelegate,ShufflingViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupShufflingView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupConfiguration];

}
-(void)setupConfiguration{
    /** 配置导航 **/
    self.navigationItem.title = @"首页";
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u308.png"]];
    imageView.frame = CGRectMake(0, 0, 40, 40);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.navigationItem setTitleView:imageView];
    /** 设置导航左右按钮 **/
    UIButton *searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [searchBtn setImage:[UIImage imageNamed:@"Search.png"] forState:(UIControlStateNormal)];
    searchBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [searchBtn addTarget:self action:@selector(search) forControlEvents:(UIControlEventTouchUpInside)];
    searchBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    searchBtn.frame = CGRectMake(0, 0, 40, 20);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
    UIButton *placeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [placeBtn setImage:[UIImage imageNamed:@"Location.png"] forState:(UIControlStateNormal)];
    [placeBtn addTarget:self action:@selector(place) forControlEvents:(UIControlEventTouchUpInside)];
    [placeBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [placeBtn setTitle:@"深圳" forState:(UIControlStateNormal)];
    placeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    placeBtn.frame = CGRectMake(0, 0, 60, 25);
    placeBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    placeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:placeBtn];
}
-(void)place{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)search{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)setupShufflingView{
    ShufflingView *shufflingView = [ShufflingView new];
    shufflingView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    shufflingView.imagesArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"];
    shufflingView.delegate = self;
    
    [self.view addSubview:shufflingView];
}
-(void)shufflingView:(ShufflingView *)shuffling didClickImageAtIndex:(NSInteger)index
{
    LWLog(@"当前点击%ld页",index);
}




@end

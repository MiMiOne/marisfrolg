//
//  ADPageViewController.m
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "ADPageViewController.h"
#import "ADPageView.h"
#import "ADCountdownLabel.h"
@interface ADPageViewController ()
@property(nonatomic,strong)ADPageView *pageView;
@end

@implementation ADPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self pageViewInit];
}
-(void)pageViewInit{
    _pageView = [[ADPageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
//     _pageView.pageURLString = @""; //这个里面可以写url的连接  动态改变广告页面
    _pageView.blockSelectAD = ^{
        LWLog(@"广告页被点击,请在这里Do Something");
        
    };
    [self.view addSubview:_pageView];
    LWWeakSelf(self);
    ADCountdownLabel *countdownLabel = [[ADCountdownLabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 70, 30, 60, 30)];
    countdownLabel.blockNewViewController = ^{
        [weakself removerADPageView];
    };
    [_pageView addSubview:countdownLabel];
    
    
}
-(void)removerADPageView{
    LWWeakSelf(self);
    [UIView animateWithDuration:1 animations:^{
        weakself.pageView.alpha = 0.1;
    } completion:^(BOOL finished) {
        if (weakself.blockMainViewController) {
            weakself.blockMainViewController();
        }
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

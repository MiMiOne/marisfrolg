//
//  ADCountdownLabel.m
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "ADCountdownLabel.h"

@interface ADCountdownLabel()
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ADCountdownLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 16;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.text = @"5秒后跳转";
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:10];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
        [self addGestureRecognizer:singleTap];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(jumpNewViewController) userInfo:nil repeats:YES];
        
        
    }
    
    return self;
    
}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    if (self.blockNewViewController) {
        [_timer invalidate];
        _timer = nil;
        self.blockNewViewController();
    }
}
-(void)jumpNewViewController{
    static int z = 0;
    z++;
    self.text = [NSString stringWithFormat:@"%d 跳过",5-z];
    if (z == 5) {
        if (self.blockNewViewController) {
            [_timer invalidate];
            _timer = nil;
            self.blockNewViewController();
        }
    }
}
@end

//
//  ADPageView.m
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "ADPageView.h"
#import <UIImageView+YYWebImage.h>
@interface ADPageView()
@property(nonatomic,strong)UIImageView *ADImageView;

@end
@implementation ADPageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        _ADImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _ADImageView.userInteractionEnabled = YES;
        [self addSubview:_ADImageView];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_ADImageView addGestureRecognizer:singleTap];
    }
    
    return self;
}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    if (self.blockSelectAD) {
        self.blockSelectAD();
    }
}

-(void)layoutSubviews
{
    NSURL *url = [NSURL URLWithString:self.pageURLString];
    LWWeakSelf(self);
    [self.ADImageView setImageWithURL:url placeholder:[UIImage imageNamed:@"AD"] options:YYWebImageOptionAvoidSetImage completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (image && (from == YYWebImageFromMemoryCache || from == YYWebImageFromDiskCache)) {
            weakself.ADImageView.image = image;
        }else{
            LWLog(@"这是第一次从网上加载，没有数据");
        }
    }];
}
@end

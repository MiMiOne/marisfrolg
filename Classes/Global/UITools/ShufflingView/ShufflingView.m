//
//  ShufflingView.m
//  ScrollView
//
//  Created by Wiley on 2017/6/1.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "ShufflingView.h"
static int imageViewCount = 3;

@interface ShufflingView()<UIScrollViewDelegate,ShufflingViewDelegate>

/** 定时器 **/
@property(nonatomic,strong)NSTimer *timer;
/** 标题Label **/
@property(nonatomic,weak)UILabel * titleLabel;

/** 滚动视图**/
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/** 页面小圆点 **/
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;



@end
@implementation ShufflingView

/** 返回实例对象 **/
+(instancetype)shufflingView{
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

/** 代码创建 **/
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIScrollView *scrollView = [UIScrollView new];
        self.scrollView = scrollView;
        [self addSubview:scrollView];
        
        UIPageControl *pageControl = [UIPageControl new];
        self.pageControl = pageControl;
        [self addSubview:pageControl];
        
        //基础设置
        [self setup];
        
    }
    
    return self;
}

/** xib创建 **/
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

/** 基础设置 **/
-(void)setup{
    for (int i = 0 ; i < imageViewCount; i ++) {
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
        
        //每个IV设置点击事件
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedImageView:)];
        [imageView addGestureRecognizer:tap];
    }
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
#warning  ------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!----------------------------------------------
    self.scrollView.contentSize = CGSizeMake(imageViewCount* self.scrollView.frame.size.width, 0);
    
    //PageControll颜色配置
    self.pageControl.currentPageIndicatorTintColor = LWRGBColor(206, 166, 106);
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
}
/** 重置frame **/
#warning  ------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!----------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews ];
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(imageViewCount * self.bounds.size.width, 0);
    for (int i = 0; i < imageViewCount; i ++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    // 重写pageControl的布局
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = self.scrollView.frame.size.width - pageW;
    CGFloat pageY = self.scrollView.frame.size.height - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    //重写titleLabel的布局
    CGFloat titleH = 50;
    self.titleLabel.frame =CGRectMake(0, self.frame.size.height - titleH, self.frame.size.width, titleH);
    
}
#pragma mark - 重写set方法
/** 设置Image **/
-(void)setImagesArr:(NSArray *)imagesArr{
    
    _imagesArr = imagesArr;
    
    //设置
    self.pageControl.numberOfPages = imagesArr.count;
    self.pageControl.currentPage = 0;
    
    //设置内容
    [self setupContent];
    //设置定时功能
    [self startTimer];
}
/** 设置标题 **/
-(void)setTitlesArr:(NSArray *)titlesArr{
    _titlesArr = titlesArr;
    
    //创建一个标题的Label
    UILabel *titleLabel = [UILabel new];
    titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    titleLabel.text = titlesArr.firstObject;
    
}

/** 设置内容 **/
-(void)setupContent{
    // 设置图片，页码（这是一个循环，自己演算一下即可）
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        imageView.tag = index;
        imageView.image = [UIImage imageNamed:self.imagesArr[index]];
        
        // 同时设置title（title 和 图片是对应的，但是当前title和当前要展示的image属于错位1个单位的关系,实际上是延迟了一个单位，所以需要重新计算）
        self.titleLabel.text = self.titlesArr[index];
    }
    //设置当前偏移量
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    
    //重置偏移量之后重新计算对应的title(取出当前页码，减去1即可)
    NSString *currentTitle = self.titleLabel.text;
    NSInteger titleIndex = [self.titlesArr indexOfObject:currentTitle];
    
    titleIndex --; // 自减一
    
    if (titleIndex  < 0) titleIndex = self.titlesArr.count - 1;
    
    // 重新设置对应的title
    self.titleLabel.text = self.titlesArr[titleIndex];
}
#pragma mark - 代理监听页面滚动
/** scrollView滚动 **/
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = 0;
        
        distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    
    self.pageControl.currentPage = page;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endTimer];

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self setupContent];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self setupContent];
}

#pragma mark - 定时器
/** 开始定时器 **/
-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self newPage];
    }];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/** 结束Timer **/
-(void)endTimer{
    [self.timer invalidate];
    self.timer = nil;
}

/** 下一页 **/
-(void)newPage{
    [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];

}
/** 图片点击响应 **/
-(void)clickedImageView:(UITapGestureRecognizer *)tap{
    UIImageView *imageView = (UIImageView *)tap.view;
    
    if ([self.delegate respondsToSelector:@selector(shufflingView:didClickImageAtIndex:)]) {
        
        [self.delegate shufflingView:self didClickImageAtIndex:imageView.tag];
    }
}
@end

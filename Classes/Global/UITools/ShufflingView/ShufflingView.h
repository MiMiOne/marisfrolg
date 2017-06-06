//
//  ShufflingView.h
//  ScrollView
//
//  Created by Wiley on 2017/6/1.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShufflingView;

@protocol ShufflingViewDelegate <NSObject>

@optional

/** 监听点击的图片和位置**/
-(void)shufflingView:(ShufflingView*)shuffling didClickImageAtIndex:(NSInteger )index;

@end

@interface ShufflingView : UIView

/** 要显示的图片数组 **/
@property(nonatomic,strong)NSArray * imagesArr;
/** 要显示的标题数组 **/
@property(nonatomic,strong)NSArray * titlesArr;
/** 代理 **/
@property(nonatomic,weak)id<ShufflingViewDelegate> delegate;


+(instancetype)shufflingView;

@end

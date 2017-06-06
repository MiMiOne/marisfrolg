//
//  UIBarButtonItem+Extension.m
//  Marisfrolg
//
//  Created by Wiley on 2017/6/6.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)initWithImage:(NSString *)imageName andSelectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    if (selectImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:selectImageName] forState:(UIControlStateSelected)];
    }
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 30);
    
    return [[self alloc]initWithCustomView:btn];
}
@end

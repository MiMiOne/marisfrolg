//
//  UIBarButtonItem+Extension.h
//  Marisfrolg
//
//  Created by Wiley on 2017/6/6.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)initWithImage:(NSString *)imageName andSelectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action;

@end

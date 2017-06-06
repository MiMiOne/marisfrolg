//
//  ADPageView.h
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^blockSelectAD) ();

@interface ADPageView : UIView

@property(nonatomic,copy)blockSelectAD  blockSelectAD;
@property(nonatomic,copy)NSString * pageURLString;
@end

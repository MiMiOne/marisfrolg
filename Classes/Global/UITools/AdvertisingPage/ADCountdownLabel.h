//
//  ADCountdownLabel.h
//  Template
//
//  Created by Wiley on 2017/5/31.
//  Copyright © 2017年 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^blockNewViewConrtoller)();
@interface ADCountdownLabel : UILabel
@property(nonatomic,copy)blockNewViewConrtoller blockNewViewController;

@end

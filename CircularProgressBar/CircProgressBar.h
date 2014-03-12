//
//  CircProgressBar.h
//  CircularProgressBar
//
//  Created by wangduan on 14-3-11.
//  Copyright (c) 2014年 wxcp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircProgressBar : UIView

//进度条总进进度，1.0f；
@property (assign, nonatomic,readonly) CGFloat progressTotal;
//进度条当前的进度，0.0--0.1之间。。
@property (assign, nonatomic) CGFloat progressCurrent;

//进度条完成的颜色。默认蓝色。
@property (strong, nonatomic) UIColor *completedColor;
//进度条未完成的颜色。默认灰色
@property (strong, nonatomic) UIColor *incompletedColor;

//进度条的厚度。默认10.0f；
@property (assign, nonatomic) CGFloat thickness;

@end

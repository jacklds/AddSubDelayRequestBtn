//
//  XYYAddSubBtnRecognizer.h
//  YaoBangMang
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import <UIKit/UIKit.h>
// 代理方法
@protocol XYYAddSubBtnRecognizerDelegate <NSObject>

@optional
// 点击加号按钮
- (void)XYYAddSubBtnClick:(UIView *)tapview;
@end

@interface XYYAddSubBtnRecognizer : UIGestureRecognizer

@property (nonatomic ,assign) NSInteger touchTime;
@property (nonatomic ,weak)  id <XYYAddSubBtnRecognizerDelegate>resDelegate;

@end

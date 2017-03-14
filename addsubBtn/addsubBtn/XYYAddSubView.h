//
//  XYYAddSubView.h
//  YaoBangMang
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ADD_SUB_TYPE)
{
    ADDSUB_BIG = 1,
    ADDSUB_SMALL
};

@class XYYControlProductM;
@interface XYYAddSubView : UIView

@property (nonatomic ,strong) UIButton *btnAdd;
@property (nonatomic ,strong) UIButton *btnSub;
@property (nonatomic ,strong) UITextField *fieldCount;

@property (nonatomic ,weak) UIViewController *recView;

@property (nonatomic ,strong) XYYControlProductM *model;
@property (nonatomic ,assign) NSInteger productCount;
@property (nonatomic ,assign) ADD_SUB_TYPE type;

- (instancetype)initWithType:(ADD_SUB_TYPE)type;

@end

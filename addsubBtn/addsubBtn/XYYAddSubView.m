//
//  XYYAddSubView.m
//  YaoBangMang
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import "XYYAddSubView.h"
#import "XYYAddSubBtnRecognizer.h"
#import "Masonry.h"
#import "UIColor+Convert.h"
#import "UIViewController+SendData.h"

@interface XYYAddSubView () <XYYAddSubBtnRecognizerDelegate,UITextFieldDelegate>

@property (nonatomic, strong) XYYAddSubBtnRecognizer *addRec;
@property (nonatomic ,strong) XYYAddSubBtnRecognizer *subRec;
@property (nonatomic ,strong) UITapGestureRecognizer *tapRec;

@end

@implementation XYYAddSubView

- (instancetype)initWithType:(ADD_SUB_TYPE)type
{
    if (self = [super init]) {
        _type = type;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    if (self.type == ADDSUB_SMALL) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorByByteWithRed:153 green:153 blue:153 andFloatAlpha:1].CGColor;
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
    }
    else
    {
        UIView *lineview = [[UIView alloc] init];
        lineview.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
        [self addSubview:lineview];
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(0.5));
            make.top.equalTo(self.mas_top);
        }];
    }
    
    
    self.btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnAdd setImage:[UIImage imageNamed:@"shangpinxiangqing_shuliang_jia_btn"] forState:UIControlStateNormal];
    [self.btnAdd addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: self.btnAdd];
    
    self.btnSub = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSub setImage:[UIImage imageNamed:@"shangpinxiangqing_shuliang_jian_btn"] forState:UIControlStateNormal];
    [self.btnSub addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnSub];
    
    UIView *lineOne = [[UIView alloc] init];
    lineOne.backgroundColor = [UIColor colorByByteWithRed:153 green:153 blue:153 andFloatAlpha:1];
    [self addSubview:lineOne];
    
    UIView *lineTwo = [[UIView alloc] init];
    lineTwo.backgroundColor = [UIColor colorByByteWithRed:153 green:153 blue:153 andFloatAlpha:1];
    [self addSubview:lineTwo];
    
    self.fieldCount = [[UITextField alloc] init];
    self.fieldCount.delegate = self;
    self.fieldCount.borderStyle = UITextBorderStyleNone;
    self.fieldCount.textColor = [UIColor colorByByteWithRed:102 green:102 blue:102 andFloatAlpha:1];
    self.fieldCount.keyboardType = UIKeyboardTypeNumberPad;
    self.fieldCount.textAlignment = NSTextAlignmentCenter;
    self.fieldCount.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.fieldCount];
    
    [self.btnSub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
    }];
    [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.btnSub.mas_right);
        make.width.equalTo(@(0.5));
    }];
    [self.btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
    }];
    [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btnAdd.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(@0.5);
    }];
    if (self.type == ADDSUB_BIG) {
        [self.fieldCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@28);
            make.left.equalTo(lineOne.mas_right);
            make.right.equalTo(lineTwo.mas_left);
        }];
    }
    else {
        [self.fieldCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(lineOne.mas_right);
            make.right.equalTo(lineTwo.mas_left);
        }];
    }
   
    
    XYYAddSubBtnRecognizer *addRec = [[XYYAddSubBtnRecognizer alloc] initWithTarget:self action:@selector(pushProductCountToServer)];
    self.addRec = addRec;
    addRec.resDelegate = self;
    [self.btnAdd addGestureRecognizer:addRec];
    
    XYYAddSubBtnRecognizer *subRec = [[XYYAddSubBtnRecognizer alloc] initWithTarget:self action:@selector(pushProductCountToServer)];
    self.subRec = subRec;
    subRec.resDelegate = self;
    [self.btnSub addGestureRecognizer:subRec];
    
    self.tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:self.tapRec];
    self.tapRec.enabled = NO;
    
    if (self.type == ADDSUB_BIG) {
        lineOne.hidden = YES;
        lineTwo.hidden = YES;
        self.fieldCount.layer.borderWidth = 0.5;
        self.fieldCount.layer.borderColor = [UIColor colorWithHexString:@"999999" alpha:1].CGColor;
        self.fieldCount.layer.cornerRadius = 2;
    }
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.fieldCount.text integerValue] < 1) {
        textField.text = [NSString stringWithFormat:@"%@",@(self.productCount)];
        return;
    }
    [self pushProductCountToServer];
}


#pragma mark - XYYAddSubBtnRecognizerDelegate

- (void)XYYAddSubBtnClick:(UIView *)tapview
{
    
    if (tapview == self.btnSub) {
        //点击减号
        if ([self.fieldCount.text integerValue] <= 1) {
           // [XYYToast showToastMessage:@"商品数目不能小于1"];
            return;
        }
        [self.recView sendData:nil Type:DATA_TYPE_SUBCLICK];
        NSInteger count = [self.fieldCount.text integerValue];
        NSInteger subcount = count - 1;
        self.productCount = subcount;
        self.fieldCount.text = [NSString stringWithFormat:@"%@",@(subcount)];
    }
    if (tapview == self.btnAdd) {
        //点击加号
        [self.recView sendData:nil Type:DATA_TYPE_ADDCLICK];
        NSInteger count = [self.fieldCount.text integerValue];
        NSInteger addcount = count + 10;
        self.productCount = addcount;
        self.fieldCount.text = [NSString stringWithFormat:@"%@",@(addcount)];
        //[self.recView viewSendData:nil Type:XYY_V_SD_ADDSUBCLICK];
    }
}


#pragma mark - custom api 

- (void)tap
{

}

- (void)pushProductCountToServer
{
    [self.recView sendData:nil Type:DATA_TYPE_POSTSERVER];
    //XYYLog(@"begin request");
//    WEAKSELF
//    NSInteger count = [self.fieldCount.text integerValue];
//    [ InterfaceManager addSubProductBagByID:self.model.ID Count:self.fieldCount.text Completion:^(BOOL isSuccess, NSString *msg, id data) {
//        if (isSuccess) {
//            if (count == [weakSelf.fieldCount.text integerValue]) {
//                XYYLog(@"fiinish request %@ == %@",@(count),self.fieldCount.text);
//                weakSelf.fieldCount.text = [NSString stringWithFormat:@"%@",data];
//                weakSelf.productCount = [data integerValue];
//                [[ShareSingleTon ShareSingleTonManager] updateShoppingNumber:weakSelf.fieldCount.text changeKey:weakSelf.model.ID];
//                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUpdateShoppingNumOnView object:nil];
//                [[NSNotificationCenter defaultCenter] postNotificationName:NotificationPlanNeedUpdate object:nil];
//                [self setUpCommodityTypeNumberData];
//            }
//            
//        }
//        else {
//            XYYLog(@"被放弃的回调");
//        }
//        if (msg != nil) {
//            
//            [XYYToast showDetaiToastMessage:msg];
//        }
//        
//    }];
}


#pragma mark - set get


@end

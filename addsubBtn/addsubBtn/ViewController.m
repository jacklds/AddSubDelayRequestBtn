//
//  ViewController.m
//  addsubBtn
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import "ViewController.h"
#import "XYYAddSubView.h"
#import "Masonry.h"
#import "UIViewController+SendData.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *logtextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    XYYAddSubView *btnview = [[XYYAddSubView alloc] initWithType:ADDSUB_SMALL];
    btnview.recView = self;
    [self.view addSubview:btnview];
    [btnview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@115);
        make.height.equalTo(@30);
    }];
    self.logtextView = [[UITextView alloc] init];
    [self.view addSubview:self.logtextView];
    [self.logtextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(btnview.mas_bottom).offset(10);
    }];
}

- (void)sendData:(id)data Type:(XYY_SENDDATA_TYPE)type
{
    switch (type) {
        case DATA_TYPE_POSTSERVER:
        {
            self.logtextView.text = [self.logtextView.text stringByAppendingString:@"\n1请求接口了"];
        }
            break;
        case DATA_TYPE_ADDCLICK:
        {
            self.logtextView.text = [self.logtextView.text stringByAppendingString:@"\n2点击+++按钮"];
        }
            break;
        case DATA_TYPE_SUBCLICK:
        {
            self.logtextView.text = [self.logtextView.text stringByAppendingString:@"\n3点击---按钮"];
        }
            break;
        default:
            break;
    }
    [self.logtextView setContentOffset:CGPointMake(0, self.logtextView.contentSize.height-self.logtextView.frame.size.height)];
}


@end

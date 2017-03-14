//
//  UIViewController+SendData.h
//  YaoBangMang
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, XYY_SENDDATA_TYPE)
{
    DATA_TYPE_ADDCLICK,
    DATA_TYPE_SUBCLICK,
    DATA_TYPE_POSTSERVER
};

@interface UIViewController (SendData)

- (void)sendData:(id)data Type:(XYY_SENDDATA_TYPE)type;

@end

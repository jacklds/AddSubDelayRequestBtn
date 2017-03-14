//
//  UIColor+Convert.h
//  addsubBtn
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Convert)

+(UIColor *)colorByByteWithRed:(Byte)red green:(Byte)gree blue:(Byte)blue andFloatAlpha:(CGFloat) alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

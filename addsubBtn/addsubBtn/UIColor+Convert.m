//
//  UIColor+Convert.m
//  addsubBtn
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import "UIColor+Convert.h"

@implementation UIColor (Convert)


+(UIColor *)colorByByteWithRed:(Byte)red green:(Byte)gree blue:(Byte)blue andFloatAlpha:(CGFloat) alpha
{
    CGFloat f = 1./255;
    return [UIColor colorWithRed:f * red green:f * gree blue:f * blue alpha: alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) {
        
        return [UIColor clearColor];
    }
    
    //如果是以0x开头,那么截取字符串,字符串从索引为2的位置开始,一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        
        cString = [cString substringFromIndex:2];
    }
    
    //如果是以#开头,那么截取字符串,字符串从索引为1的位置开始,一直到末尾
    if ([cString hasPrefix:@"#"]) {
        
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location =4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
    
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color {
    
    return [self colorWithHexString:color alpha:1.0f];
}


@end

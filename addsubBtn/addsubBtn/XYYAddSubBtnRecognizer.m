//
//  XYYAddSubBtnRecognizer.m
//  YaoBangMang
//
//  Created by lidashuang on 2017/3/14.
//  Copyright © 2017年 lidashuang. All rights reserved.
//

#import "XYYAddSubBtnRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#define timeDelay  400.0

@implementation XYYAddSubBtnRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //一次点击,执行点击+-号逻辑，但是不调用接口
    [self.resDelegate XYYAddSubBtnClick:self.view];
   // self.touchTime = [[NSDate date] timeIntervalSince1970];//event.timestamp;
    if (self.touchTime == 0) {
        self.touchTime = [[NSDate date] timeIntervalSince1970]*1000;//event.timestamp;
        [self performSelector:@selector(finish) withObject:nil afterDelay:timeDelay/1000.0 inModes:@[NSRunLoopCommonModes]];
    }
    else {
        if (( [[NSDate date] timeIntervalSince1970]*1000 - self.touchTime)<timeDelay) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(finish) object:nil];
            [self performSelector:@selector(finish) withObject:nil afterDelay:timeDelay/1000.0 inModes:@[NSRunLoopCommonModes]];
            self.touchTime = [[NSDate date] timeIntervalSince1970]*1000;
        }
        
    }
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (void)finish
{
    self.state = UIGestureRecognizerStateEnded;
    self.touchTime = 0;
}
@end

//
//  ZJSTableView.m
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/30.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import "ZJSTableView.h"

@implementation ZJSTableView


-(BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view{
    //  DLOG_METHOD
    
    //    if ([view isKindOfClass:[ASScheduleIntervalPicker class]]) {
    //
    //        // 手指如果是在轨道上则不相应scrollview滚动事件
    //        UITouch *touch = [touches anyObject];
    //        CGPoint point = [touch locationInView:view];
    //        ASScheduleIntervalPicker *picker = (ASScheduleIntervalPicker*)view;
    //        CGPoint center = CGPointMake(CGRectGetWidth(picker.frame)/2.f, CGRectGetHeight(picker.frame)/2.f);
    //
    //        CGFloat radius = sqrt(powf(point.x-center.x,2)+powf(point.y-center.y,2));
    //        if (powf((radius-picker.radius), 2)<powf((picker.lineWidth/2.f)*1.2, 2)) {
    //            return YES;
    //        }
    //        // NO 表示处理scrollview滚动
    //        return NO;
    //    }
    
    if ([self.ZJS_Delegate respondsToSelector:@selector(ZJS_tableView:touchesShouldBegin:withEvent:inContentView:)]) {
        return [self.ZJS_Delegate ZJS_tableView:self touchesShouldBegin:touches withEvent:event inContentView:view];
    }
    
    
    BOOL b = [super touchesShouldBegin:touches withEvent:event inContentView:view];
    // DLog(@"%@ :%@",b?@"YES":@"NO",view);
    return b;
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//      [[self nextResponder] touchesBegan:touches withEvent:event];
//    return;
//        if (!self.dragging) {
//            [[self nextResponder] touchesBegan:touches withEvent:event];
//            return;
//        }
//        [super touchesBegan:touches withEvent:event];
//}
////
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    if (!self.dragging) {
//        [[self nextResponder] touchesMoved:touches withEvent:event];
//        return;
//    }
//    [super touchesMoved:touches withEvent:event];
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    if (!self.dragging) {
//        [self.nextResponder touchesEnded:touches withEvent:event] ;
//        return;
//    }
//    [super touchesEnded:touches withEvent:event];
//}

@end

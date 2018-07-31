//
//  ZJSScrollView.h
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/30.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJSScrollView;


@protocol ZJSScrollViewDelegate<NSObject>

-(BOOL)ZJS_scrollView:(ZJSScrollView*)scrollView  touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;

@end

@interface ZJSScrollView : UIScrollView

@property (nonatomic, weak) id<ZJSScrollViewDelegate>  ZJS_Delegate;

@end

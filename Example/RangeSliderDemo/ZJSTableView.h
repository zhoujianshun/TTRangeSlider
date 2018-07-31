//
//  ZJSTableView.h
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/30.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJSTableView;

@protocol ZJSTableViewDelegate<NSObject>

-(BOOL)ZJS_tableView:(ZJSTableView*)tableView touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;

@end

@interface ZJSTableView : UITableView

@property (nonatomic, weak) id<ZJSTableViewDelegate>  ZJS_Delegate;

@end

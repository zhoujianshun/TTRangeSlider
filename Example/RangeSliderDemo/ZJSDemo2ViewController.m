//
//  ZJSDemo2ViewController.m
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/30.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import "ZJSDemo2ViewController.h"

#import <TTRangeSlider/TTRangeSlider.h>

#import "ZJSColorMacros.h"
#import "ZJSDemo2ChildViewController.h"

@interface ZJSDemo2ViewController ()<TTRangeSliderDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) TTRangeSlider *rangeSlider;
@property (nonatomic, strong) ZJSDemo2ChildViewController *vc;


@end

@implementation ZJSDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.frame;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*2, CGRectGetHeight(self.view.frame) - 100);
    
    [self.scrollView addSubview:self.rangeSlider];
    self.rangeSlider.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.frame) - 40, 60);
    
    self.vc = [[ZJSDemo2ChildViewController alloc] init];
    CGRect frame = self.scrollView.frame;
    frame.origin.x = CGRectGetWidth(self.scrollView.frame);
    self.vc.view.frame = frame;
    
    [self addChildViewController:self.vc];
    [self.scrollView addSubview:self.vc.view];
    [self.vc didMoveToParentViewController:self];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - TTRangeSliderDelegate

-(void)rangeSlider:(TTRangeSlider *)sender didChangeValueByUserActionsSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    NSLog(@"%s",__func__);
}

-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    NSLog(@"%s",__func__);
}


#pragma mark - getters and setters

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
        _scrollView.pagingEnabled = YES;
        
        // 处理滑动rangeSlider滑动的手势。
        _scrollView.delaysContentTouches = NO;
        _scrollView.canCancelContentTouches = YES;
    }
    return _scrollView;
}

-(TTRangeSlider *)rangeSlider{
    if (!_rangeSlider) {
        _rangeSlider = [[TTRangeSlider alloc] init];
        _rangeSlider.delegate = self;
        _rangeSlider.hideLabels = YES;
        _rangeSlider.handleColor = [UIColor redColor];
        _rangeSlider.minValue = 0;
        _rangeSlider.maxValue = 100;
        //        _rangeSlider.handleDiameter = 60;
        _rangeSlider.selectedMinimum = 40;
        _rangeSlider.selectedMaximum = 60;
        //_rangeSlider.handleImage = [UIImage imageNamed:@"icon_device_setting_slider_thumb"];
        _rangeSlider.selectedHandleDiameterMultiplier = 1;
        _rangeSlider.tintColorBetweenHandles = RGBHEX(0x489BFF);
        _rangeSlider.lineHeight = 5;
        _rangeSlider.tintColor = RGBHEX(0xE4E6E8);
        _rangeSlider.minDistance = 1.f;
        _rangeSlider.backgroundColor = [UIColor whiteColor];
        //        _rangeSlider.step = 10;
        //        _rangeSlider.enableStep = YES;
        //        _rangeSlider.stepContinues = YES;
    }
    return _rangeSlider;
}


@end

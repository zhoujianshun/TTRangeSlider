//
//  ZJSDemoViewController.m
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/27.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import "ZJSDemoViewController.h"

#import <TTRangeSlider/TTRangeSlider.h>

#import "ZJSColorMacros.h"

@interface ZJSDemoViewController ()<TTRangeSliderDelegate>

@property (nonatomic, strong) TTRangeSlider *rangeSlider;
@property (nonatomic, strong) TTRangeSlider *rangeSlider2;

@end

@implementation ZJSDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.rangeSlider];
    self.rangeSlider.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.frame) - 40, 60);
    
    [self.view addSubview:self.rangeSlider2];
    self.rangeSlider2.frame = CGRectMake(20, 170, CGRectGetWidth(self.view.frame) - 40, 60);
    
//    UISlider
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

-(void)didEndTouchesInRangeSlider:(TTRangeSlider *)sender{
    NSLog(@"selectedMinimum:%@, selectedMaximum:%@", @(sender.selectedMinimum), @(sender.selectedMaximum));
}

-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
     NSLog(@"didChange selectedMinimum:%@, selectedMaximum:%@", @(sender.selectedMinimum), @(sender.selectedMaximum));
}


-(TTRangeSlider *)rangeSlider{
    if (!_rangeSlider) {
        _rangeSlider = [[TTRangeSlider alloc] init];
        _rangeSlider.delegate = self;
        _rangeSlider.hideLabels = YES;
        _rangeSlider.handleColor = [UIColor clearColor];
        _rangeSlider.minValue = 0;
        _rangeSlider.maxValue = 100;
        _rangeSlider.selectedMinimum = 40;
        _rangeSlider.selectedMaximum = 60;
        _rangeSlider.handleImage = [UIImage imageNamed:@"icon_device_setting_slider_thumb"];
        _rangeSlider.selectedHandleDiameterMultiplier = 1;
        _rangeSlider.tintColorBetweenHandles = RGBHEX(0x489BFF);
        _rangeSlider.lineHeight = 5;
        _rangeSlider.tintColor = RGBHEX(0xE4E6E8);
        _rangeSlider.minDistance = 1.f;
        _rangeSlider.step = 10;
        _rangeSlider.enableStep = YES;
        _rangeSlider.stepContinues = YES;
    }
    return _rangeSlider;
}


-(TTRangeSlider *)rangeSlider2{
    if (!_rangeSlider2) {
        _rangeSlider2 = [[TTRangeSlider alloc] init];
        _rangeSlider2.delegate = self;
        _rangeSlider2.hideLabels = YES;
        _rangeSlider2.handleColor = [UIColor redColor];
        _rangeSlider2.minValue = 0;
        _rangeSlider2.maxValue = 100;
        _rangeSlider2.selectedMinimum = 0;
        _rangeSlider2.selectedMaximum = 60;
        // _rangeSlider.handleImage = [UIImage imageNamed:@"icon_device_setting_slider_thumb"];
        _rangeSlider2.selectedHandleDiameterMultiplier = 1;
        _rangeSlider2.tintColorBetweenHandles = RGBHEX(0x489BFF);
        _rangeSlider2.lineHeight = 10;
        _rangeSlider2.tintColor = RGBHEX(0xE4E6E8);
        _rangeSlider2.disableRange = YES;
//        rangeSlider2.minDistance = 1.f;
//        rangeSlider2.step = 10;
//        rangeSlider2.enableStep = YES;
//        rangeSlider2.stepContinues = YES;
    }
    return _rangeSlider2;
}

@end

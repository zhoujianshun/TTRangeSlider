//
//  ZJSDemo2ChildViewController.m
//  RangeSliderDemo
//
//  Created by 周建顺 on 2018/7/30.
//  Copyright © 2018年 tomthorpe. All rights reserved.
//

#import "ZJSDemo2ChildViewController.h"

#import <TTRangeSlider/TTRangeSlider.h>

#import "ZJSColorMacros.h"

#import "ZJSTableView.h"

#define kTableViewCellIdetify @"kTableViewCellIdetify"

@interface ZJSDemo2ChildViewController () <UITableViewDelegate, UITableViewDataSource, ZJSTableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) ZJSTableView *tableView;
@property (nonatomic, strong) TTRangeSlider *rangeSlider;

@end

@implementation ZJSDemo2ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    NSDictionary *views = @{@"tableView":self.tableView};
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[tableView]-0-|" options:0 metrics:nil views:views];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tableView]-0-|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraintH];
    [self.view addConstraints:constraintV];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdetify forIndexPath:indexPath];
 
    [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
       [cell.contentView addSubview:self.rangeSlider];
    NSDictionary *views = @{@"rangeSlider":self.rangeSlider};
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[rangeSlider]-0-|" options:0 metrics:nil views:views];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rangeSlider]-0-|" options:0 metrics:nil views:views];
    [cell.contentView addConstraints:constraintH];
    [cell.contentView addConstraints:constraintV];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


#pragma mark - ZJSTableViewDelegate
-(BOOL)ZJS_tableView:(ZJSTableView *)tableView touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view{
    if ([view isKindOfClass:[TTRangeSlider class]]) {
        return YES;
    }
    return NO;

}

#pragma mark - getters and setters

-(ZJSTableView *)tableView{
    if (!_tableView) {
        _tableView = [[ZJSTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.ZJS_Delegate = self;
      //  _tableView.panGestureRecognizer.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdetify];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        
        // 处理滑动rangeSlider滑动的手势。
        _tableView.delaysContentTouches = NO;
        _tableView.canCancelContentTouches = YES;
    }
    return _tableView;
}


-(TTRangeSlider *)rangeSlider{
    if (!_rangeSlider) {
        _rangeSlider = [[TTRangeSlider alloc] init];
        _rangeSlider.translatesAutoresizingMaskIntoConstraints = NO;
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


//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    return YES;
//}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press{
//    return YES;
//}
//
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    return YES;
//}
////


@end

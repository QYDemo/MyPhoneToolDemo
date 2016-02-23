//
//  QY_CPUViewController.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_CPUViewController.h"
#import "WMGaugeView.h"
@interface QY_CPUViewController ()
{
    CADisplayLink *disllayLink;
    WMGaugeView *guanView;
}

@end

@implementation QY_CPUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"CPU状态";
    guanView = [[WMGaugeView alloc] initWithFrame:CGRectMake(20, 200, 200, 200)];
    guanView.center = self.view.center;
    guanView.minValue = 0;
    guanView.maxValue = 120.f;
    [self.view addSubview:guanView];
    
    disllayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refreshCPU)];
    [disllayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)refreshCPU
{
    static int i = 0;
    i ++;
    if (i == 20) {
        [guanView setValue:[QYDeviceTool cpu_usage] animated:NO];
        i = 0;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    disllayLink.paused = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    disllayLink.paused = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchInfomationBtn:(UIButton *)btn
{
    NSLog(@"cpu");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

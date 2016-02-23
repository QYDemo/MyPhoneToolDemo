//
//  QY_BatterViewController.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_BatterViewController.h"

@interface QY_BatterViewController ()

@end

@implementation QY_BatterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleStr = @"电池管理";
    
    CGFloat batteryLevel = [UIDevice currentDevice].batteryLevel;
    NSLog(@"batterylevel = %f",batteryLevel);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    label.text = [NSString stringWithFormat:@"%f",batteryLevel];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchInfomationBtn:(UIButton *)btn
{
 
    NSLog(@"电池");
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

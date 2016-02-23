//
//  QY_TabBarViewController.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_TabBarViewController.h"
#import "QY_BatterViewController.h"
#import "QY_CPUViewController.h"
#import "QY_MemoryViewController.h"
#import "QY_NetFlowViewController.h"

@interface QY_TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation QY_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    QY_MemoryViewController *c1 = [[QY_MemoryViewController alloc] init];
    c1.tabBarItem.title = @"内存";
    c1.informationBtnStr = @"内存详情";
    c1.tabBarItem.image = [UIImage imageNamed:@"QY_neicun"];

    
    QY_BatterViewController *c2 = [[QY_BatterViewController alloc] init];
    c2.tabBarItem.title = @"电池";
    c2.informationBtnStr = @"电池信息";
    c2.tabBarItem.image = [UIImage imageNamed:@"QY_Liuliang"];
    
    QY_CPUViewController *c3 = [[QY_CPUViewController alloc] init];
    c3.tabBarItem.title = @"CPU";
    c3.informationBtnStr = @"cpu详细信息";
    c3.tabBarItem.image = [UIImage imageNamed:@"QY_Liuliang"];
    
    QY_NetFlowViewController *c4 = [[QY_NetFlowViewController alloc] init];
    c4.tabBarItem.title = @"网络";
    c4.informationBtnStr = @"流量信息";
    c4.tabBarItem.image = [UIImage imageNamed:@"QY_Liuliang"];
    
    NSArray *VC_arr = @[c1,c3,c4];
    self.viewControllers = VC_arr;
    
    self.tabBar.barTintColor = [UIColor colorWithRed:46.f/255.f green:59.f/255.f blue:68.f/255.f alpha:1];
    self.delegate = self;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe2.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe2];
}

- (void)swipe:(UISwipeGestureRecognizer *)sw
{
    if (sw.direction == UISwipeGestureRecognizerDirectionRight) {
        self.selectedIndex = self.selectedIndex - 1;
    }
    else
    {
        self.selectedIndex = self.selectedIndex + 1;
    }

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

@end

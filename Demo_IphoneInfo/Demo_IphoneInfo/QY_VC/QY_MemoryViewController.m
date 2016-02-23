//
//  QY_MemoryViewController.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_MemoryViewController.h"
#import "QY_MemoryProgressView.h"
@interface QY_MemoryViewController ()
{
    QY_MemoryProgressView *memoryProgressView;
}

@end

@implementation QY_MemoryViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.titleStr = @"内存状态";
    
}


- (void)viewWillAppear:(BOOL)animated
{
    if (!memoryProgressView) {
        memoryProgressView = [[QY_MemoryProgressView alloc] init];
        [self.view addSubview:memoryProgressView];
        [memoryProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        memoryProgressView.Pro_size = CGSizeMake(200, 200);
        memoryProgressView.backgroundColor = [UIColor clearColor];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (memoryProgressView) {
        [memoryProgressView removeFromSuperview];
         memoryProgressView = nil;
    }
    
}

- (void)touchInfomationBtn:(UIButton *)btn
{
    NSLog(@"neicun");
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

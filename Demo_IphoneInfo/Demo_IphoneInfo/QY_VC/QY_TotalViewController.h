//
//  QY_TotalViewController.h
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QY_TotalViewController : UIViewController

@property (nonatomic , strong)NSString *titleStr;

@property (nonatomic , strong)NSString *informationBtnStr;


//!> 按钮响应方法，子类请重写改方法（父类改方法为空）
- (void)touchInfomationBtn:(UIButton *)btn;



@end

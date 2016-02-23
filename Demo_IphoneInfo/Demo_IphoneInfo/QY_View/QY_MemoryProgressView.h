//
//  QY_MemoryProgressView.h
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QY_MemoryProgressView : UIView

//!> Pro_size 该类试图大小，必需设置！！
@property (nonatomic, assign)CGSize Pro_size;
//!>
/*
 总内存
 已使用
 被占用
 可使用
 不活跃（可以抢占）
 当前程序
*/
@property (nonatomic, strong, readonly)NSArray *memoryInfoArr;
@end

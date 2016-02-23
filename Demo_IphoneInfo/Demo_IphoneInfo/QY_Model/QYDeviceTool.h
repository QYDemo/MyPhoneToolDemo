//
//  QYDeviceTool.h
//  IphoneTool
//
//  Created by ihefe－hulinhua on 2/17/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYDeviceTool : NSObject

// cpu使用率
+ (float) cpu_usage;

// 上行下行流量
+ (NSArray *)getDataCounters;

// 获取总内存大小
+ (float)getTotalMemorySize;

// 获取当前设备可用存储(单位：MB）
+(float)getAvailableDiskSize;

// 获取当前设备可用内存(单位：MB）
+ (float)availableMemory;

+ (double)usedMemory;


+(NSArray *) logMemoryInfo;
@end

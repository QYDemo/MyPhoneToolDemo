//
//  QY_MemoryProgressView.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_MemoryProgressView.h"



@interface QY_MemoryProgressView ()
{
    CAShapeLayer *shapeLayer;
    CADisplayLink *displayLink;

    CGFloat totalMemory;
    CGFloat useMemory;
}

@end

@implementation QY_MemoryProgressView


- (void)setPro_size:(CGSize)Pro_size
{
    _Pro_size = Pro_size;
    
    // 进度条的圆
    [self cicrleShapeLayer:Pro_size];
    
    // 画进度条
    [self progressShapeLayer:Pro_size];
    
//    [self rectLine];
    
    [self setNeedsDisplay];
}

- (void)cicrleShapeLayer:(CGSize)size
{
 
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    circleShapeLayer.fillColor = [UIColor clearColor].CGColor;
    circleShapeLayer.lineWidth = 10.f;
    circleShapeLayer.frame = CGRectMake(0, 0, size.width, size.height);
    circleShapeLayer.strokeColor = [UIColor colorWithRed:153.f/255.f green:182.f/255.f blue:193.f/255.f alpha:1].CGColor;
    //添加并显示
    [self.layer addSublayer:circleShapeLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pathCenter = CGPointMake(0.5f * _Pro_size.width, 0.5f * _Pro_size.height);

    [path addArcWithCenter:pathCenter radius:0.5f * _Pro_size.width - 10.f startAngle:0 endAngle:180.f clockwise:YES];
    //让贝塞尔曲线与CAShapeLayer产生联系
    circleShapeLayer.path = path.CGPath;
    
    
}


- (void)progressShapeLayer:(CGSize)size
{
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 10.f;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.frame = CGRectMake(0, 0, size.width, size.height);
    shapeLayer.strokeColor = [UIColor colorWithRed:4.f/255.f green:178.f/255.f blue:253.f/255.f alpha:1].CGColor;
    //添加并显示
    [self.layer addSublayer:shapeLayer];
    
    [self drawProgress];
    
}


// 绘制环形进度条
- (void)drawProgress
{
    NSNumber *totalValue = self.memoryInfoArr[0];
    NSNumber *wiredValue = self.memoryInfoArr[1];
    NSNumber *activeValue = self.memoryInfoArr[2];

    totalMemory = totalValue.floatValue;
    useMemory = wiredValue.floatValue + activeValue.floatValue;
    CGFloat angle = useMemory / totalMemory;
    angle = (1 - angle) * 2*M_PI;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pathCenter = CGPointMake(0.5f * _Pro_size.width, 0.5f * _Pro_size.height);
    [path addArcWithCenter:pathCenter radius:0.5f * _Pro_size.width - 10.f startAngle:2*M_PI endAngle:angle clockwise:NO];
    shapeLayer.path = path.CGPath;
}

//- (void)rectLine
//{
//    CGFloat x0 = 0.5 * _Pro_size.width;
//    CGFloat y0 = 0.5 * _Pro_size.height;
//    CGFloat r = x0;
//    
//    for (int i = 0; i < 45; i ++) {
//
//        CAShapeLayer *lineShaperLayer = [CAShapeLayer layer];
//        lineShaperLayer.fillColor = [UIColor clearColor].CGColor;
//        lineShaperLayer.lineWidth = 3.f;
//        lineShaperLayer.frame = CGRectMake(0, 0, _Pro_size.width, _Pro_size.height);
//        lineShaperLayer.strokeColor = VC_Color.CGColor;
//        //添加并显示
//        [self.layer addSublayer:lineShaperLayer];
//        
//        CGFloat x1   =   x0   +   r   *  cosf(8*i*3.14 / 180.f);
//        CGFloat y1   =   y0   +   r   *  sinf(8*i*3.14 / 180.f);
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(x0 , y0)];
//        [path addLineToPoint:CGPointMake(x1, y1)];
//     
//        lineShaperLayer.path = path.CGPath;
//    }
//}

#pragma mark - 获取内存信息
- (NSArray *)memoryInfoArr
{
    return [QYDeviceTool logMemoryInfo];
}

- (void)drawRect:(CGRect)rect
{
    [self drawLine];
    [self drawLabel];
    
    
}

// 绘制中间一条线
- (void)drawLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIColor *pathColor = [UIColor colorWithRed:121.f/255.f green:121.f/255.f blue:121.f/255.f alpha:1];
    [pathColor setStroke];
    [path moveToPoint:CGPointMake(40.f , 0.5 * _Pro_size.height + 5.f)];
    [path addLineToPoint:CGPointMake(_Pro_size.width - 40.f, 0.5 * _Pro_size.height + 5.f)];
    [path stroke];
}

- (void)drawLabel
{
    CGRect rect = CGRectMake(0.5 * _Pro_size.width - 50.f, 0.5 * _Pro_size.height - 60.f, 100.f, 25.f);
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
                            NSForegroundColorAttributeName:[UIColor colorWithRed:130.f/255.f green:134.f/255.f blue:138.f/255.f alpha:1],
                            NSParagraphStyleAttributeName:paragraph};
    
    [@"已用内存" drawInRect:rect withAttributes:attrs];
    
//******************************************
    attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
                            NSForegroundColorAttributeName:[UIColor colorWithRed:150.f/255.f green:154.f/255.f blue:158.f/255.f alpha:1],
                            NSParagraphStyleAttributeName:paragraph};
    CGRect rect2 = CGRectMake(25.f, 0.5 * _Pro_size.height - 30.f, 150.f, 30.f);
    NSString *memoryStr = [NSString stringWithFormat:@"%0.1fMB/%0.1fMB",useMemory,totalMemory];
    [memoryStr drawInRect:rect2 withAttributes:attrs];
//******************************************
    CGFloat progresfloat = 100 * (useMemory/totalMemory);
    memoryStr = [NSString stringWithFormat:@"%0.1f%%",progresfloat];
     rect2 = CGRectMake(25.f, 0.5 * _Pro_size.height + 30.f, 150.f, 30.f);
     attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:16],
              NSForegroundColorAttributeName:[UIColor colorWithRed:150.f/255.f green:154.f/255.f blue:158.f/255.f alpha:1],
              NSParagraphStyleAttributeName:paragraph};
    [memoryStr drawInRect:rect2 withAttributes:attrs];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

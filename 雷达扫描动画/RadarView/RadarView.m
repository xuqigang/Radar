//
//  RadarView.m
//  雷达扫描动画
//
//  Created by Apple on 16/9/21.
//  Copyright © 2016年 xuqigang. All rights reserved.
//

#import "RadarView.h"

@implementation RadarView
- (instancetype) initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.radarIndicatorView];
        
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawCircle:context];
    
    
}
- (RadarIndicatorView *) radarIndicatorView
{
    if (!_radarIndicatorView) {
        
        _radarIndicatorView = [[RadarIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 340, CGRectGetHeight(self.frame))];
        _radarIndicatorView.center = self.center;
        
    }
    return _radarIndicatorView;
    
}
- (void) drawCircle:(CGContextRef ) context
{
    
    //将坐标轴移动到视图中心
    CGContextTranslateCTM(context, CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 2);
    
    
    //画圆弧
    for (int i = 0; i < 4; i ++) {
        
        CGContextMoveToPoint(context, 50 + i* 35, 0);
        CGContextAddArc(context, 0, 0, 50 + i* 35, 0, M_PI * 2, 0);
        
    }
    CGContextStrokePath(context);
    
    //画十字坐标
    CGContextMoveToPoint(context, -160, 0);
    CGContextAddLineToPoint(context, 160, 0);
    
    CGContextMoveToPoint(context, 0, -160);
    CGContextAddLineToPoint(context, 0, 160);
    
    CGContextStrokePath(context);
    
}
//开始扫描
- (void) radarScan
{
    
    [self.radarIndicatorView start];
}

- (void) radarStop
{
    [self.radarIndicatorView stop];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

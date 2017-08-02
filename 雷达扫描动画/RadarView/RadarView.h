//
//  RadarView.h
//  雷达扫描动画
//
//  Created by Apple on 16/9/21.
//  Copyright © 2016年 xuqigang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadarIndicatorView.h"
@interface RadarView : UIView

@property (nonatomic, strong) RadarIndicatorView * radarIndicatorView;
- (void) radarScan;
- (void) radarStop;
@end

//
//  ViewController.m
//  雷达扫描动画
//
//  Created by Apple on 16/9/21.
//  Copyright © 2016年 xuqigang. All rights reserved.
//

#import "ViewController.h"
#import "RadarView.h"
@interface ViewController ()
@property (nonatomic, strong) RadarView * radarView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.radarView];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //执行扫描动画
    [self.radarView radarScan];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.radarView radarStop];
}
- (RadarView *) radarView
{
    if (!_radarView) {
        _radarView = [[RadarView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _radarView.center = self.view.center;
    }
    return _radarView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

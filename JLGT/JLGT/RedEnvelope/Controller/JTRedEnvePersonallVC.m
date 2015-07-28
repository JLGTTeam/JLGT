//
//  JTRedEnvePersonallVC.m
//  JLGT
//
//  Created by Hugo on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTRedEnvePersonallVC.h"

@interface JTRedEnvePersonallVC ()

@end

@implementation JTRedEnvePersonallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置View颜色
    self.view.backgroundColor = LZRGBColor(243, 243, 247);

    
    [self setUpNavBar];
    /* 看是否获取到数据 */
    NSLog(@"**********************%@",self.friendName);
}

/** 设置导航栏 */
- (void)setUpNavBar
{
    // 设置导航条颜色
    self.navigationController.navigationBar.barTintColor = LZRGBColor(231, 71, 63);
    
    
    // 导航条不为半透明
    self.navigationController.navigationBar.translucent = NO;
    
    // 设置导航条内容
    self.navigationItem.title = @"个人红包";
    
    // 设置下一个控制器返回按钮内容
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
}
/** 设置状态栏为白色 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    NSLog(@"%s",__func__);
    return UIStatusBarStyleLightContent;
}

@end

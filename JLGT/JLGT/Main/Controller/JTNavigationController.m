//
//  JLGTNavigationController.m
//  JLGT
//
//  Created by 敖然 on 15/7/22.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTNavigationController.h"

@interface JTNavigationController ()

@end

@implementation JTNavigationController

+ (void)initialize
{
    // 设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景颜色
    [navBar setBarTintColor:[UIColor colorWithRed:47/255.0 green:56/255.0 blue:70/255.0 alpha:1.0]];

    // 返回按钮箭头颜色
    [navBar setTintColor:[UIColor whiteColor]];
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"topNav"] forBarMetrics:UIBarMetricsDefault];

    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17.0f];
    [navBar setTitleTextAttributes:attrs];

    // 设置Navi文字颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *backAttrs = [NSMutableDictionary dictionary];
    backAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    backAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15.0f];
    [item setTitleTextAttributes:backAttrs forState:UIControlStateNormal];
    [item setTintColor:[UIColor whiteColor]];
}

// 调用子控制器的控制状态栏方法preferredStatusBarStyle
- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}
@end

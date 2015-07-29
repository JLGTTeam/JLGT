//
//  JTUnreadMessageEditViewController.m
//  JLGT
//
//  Created by Apple on 15/7/29.
//  Copyright © 2015年 ds. All rights reserved.
//

#import "JTUnreadMessageEditViewController.h"

@interface JTUnreadMessageEditViewController ()

@end

@implementation JTUnreadMessageEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    //设置标题
    self.title = @"添加未读消息";
    
    //隐藏标签栏
    [self.tabBarController hidesBottomBarWhenPushed];
}

/**设置导航条是否隐藏*/
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

//完成截图，返回到主界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  LZEssenceViewController.h
//  百思不得姐
//
//  Created by 王世林 on 15/7/22.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import "LZTabBarController.h"
#import "JTNavigationController.h"
#import "JTAlipayConversactionViewController.h"// 朋友？
#import "JTAlipayWealthViewController.h"//财富
#import "JTUnreadViewController.h"//未读消息
#import "JTRedEnveEntryVC.h"// 红包

@implementation LZTabBarController
#pragma mark - LZTabBarController的一次性设置


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化所有的子控制器
    [self setupChildViewControllers];
}

#pragma mark - 初始化所有的子控制器
- (void)setupChildViewControllers
{
    //创建红包模块控制器
    JTRedEnveEntryVC *eedEnveEntryVC = [[JTRedEnveEntryVC alloc] init];
    [self setupOneChildViewController:eedEnveEntryVC title:@"钱包" image:@"TabBar_HomeBar" selectedImage:@"TabBar_HomeBar_Sel"];

    //创建未读消息模块控制器中
    JTUnreadViewController *unread = [[JTUnreadViewController alloc] init];
    [self setupOneChildViewController:unread title:@"商家" image:@"TabBar_Businesses" selectedImage:@"TabBar_Businesses_Sel"];

    //创建朋友模块控制器中
    JTAlipayConversactionViewController *alipayConversaction = [[JTAlipayConversactionViewController alloc] init];
    [self setupOneChildViewController:alipayConversaction title:@"朋友" image:@"TabBar_Friends" selectedImage:@"TabBar_Friends_Sel"];

    //创建财富模块控制器中
    JTAlipayWealthViewController *alipayWealth = [[JTAlipayWealthViewController alloc] init];
    [self setupOneChildViewController:alipayWealth title:@"财富" image:@"TabBar_Assets" selectedImage:@"TabBar_Assets_Sel"];
    
}
#pragma mark 初始化的快捷方法  
/**
    vc：设置添加到TabBar控制的控制器
    title：设置TabBar控制器的TabBar下面的文字
    image：设置TabBar普通状态下显示的图片
    selectedImage：设置TabBar选中状态下显示的图片
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置文字和图片
    vc.navigationItem.title = title;    //设置navigation的头部标题
    vc.tabBarItem.title = title;        //设置TabBar控制器的TabBar内部Item显示的文字
    vc.tabBarItem.image = [UIImage imageNamed:image];//设置TabBar内部Item普通状态下显示的图片
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];//设置TabBar内部Item选中状态下显示的图片
    // 包装一个导航控制器，添加到TabBar控制器中
    [self addChildViewController:[[JTNavigationController alloc] initWithRootViewController:vc]];//把VC控制器添加到LZNavigationViewController控制中，在把包装过的LZNavigationViewController控制添加到TabBar控制器中
}
@end

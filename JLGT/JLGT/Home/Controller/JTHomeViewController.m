//
//  JTHomeViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/24.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTHomeViewController.h"
#import "JTAlipayConversactionViewController.h"
#import "JTAlipayWealthViewController.h"
#import "JTUnreadViewController.h"

@interface JTHomeViewController ()

@end

@implementation JTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickAlipayFriend:(UIButton *)sender {
    // 从storyBoard加载控制器
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:NSStringFromClass([JTAlipayConversactionViewController class]) bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"SBChat"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)clickAlipayWealth:(UIButton *)sender {
    [self.navigationController pushViewController:[[JTAlipayWealthViewController alloc] init] animated:YES];
}
- (IBAction)clickUnreadMessages:(UIButton *)sender {
    [self.navigationController pushViewController:[[JTUnreadViewController alloc] init] animated:YES];
}

@end

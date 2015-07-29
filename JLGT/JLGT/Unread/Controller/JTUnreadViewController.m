//
//  JTUnreadViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/23.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTUnreadViewController.h"

@interface JTUnreadViewController ()

@end

@implementation JTUnreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"未读消息";
    
    
    /** 云鹏开始后，以下代码可删除*/
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    v.backgroundColor = [UIColor grayColor];
    UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    labe.text = @"入口--》李 ";
    labe.textColor = [UIColor blueColor];
    [v addSubview:labe];
    [self.view addSubview:v];
}





@end

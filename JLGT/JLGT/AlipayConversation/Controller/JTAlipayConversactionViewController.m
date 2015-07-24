//
//  JTAlipayConversactionViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/23.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTAlipayConversactionViewController.h"

@interface JTAlipayConversactionViewController ()

@end

@implementation JTAlipayConversactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"朋友";
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithTitle:@"红包" style:UIBarButtonItemStyleDone target:self action:@selector(tempHongbao)];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"借条" style:UIBarButtonItemStyleDone target:self action:@selector(tempJietiao)];
    self.navigationItem.rightBarButtonItems = @[item0, item1];
}

- (void)tempHongbao {
    JTLog(@"发红包");
}

- (void)tempJietiao {
    JTLog(@"打借条");
}

@end

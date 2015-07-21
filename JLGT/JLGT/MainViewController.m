//
//  MainViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/21.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    label.text = @"hello world--截了个图!";
    [self.view addSubview:label];
    NSLog(@"We Are Best! --add By 蒋宏光");
    

}

- (void)test
{
    NSLog(@"----lpy");
}

@end

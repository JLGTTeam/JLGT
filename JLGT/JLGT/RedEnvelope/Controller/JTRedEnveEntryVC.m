//
//  JTRedEnveEntryVC.m
//  JLGT
//
//  Created by Hugo on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTRedEnveEntryVC.h"

@interface JTRedEnveEntryVC ()
@property (weak, nonatomic) IBOutlet UITextField *friendTextField;

@end

@implementation JTRedEnveEntryVC


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    
    [self setUpNavBar];
}
/** 设置导航栏 */
- (void)setUpNavBar
{
    // 设置导航栏颜色红色
    //self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:231/255.0 green:71/255.0 blue:63/255.0 alpha:1];
    
    self.navigationController.navigationBar.barTintColor = self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:247/255.0 alpha:1];
;
    //不为半透明
    //self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:247/255.0 alpha:1];
    self.navigationItem.title = @"设置朋友";
}


@end

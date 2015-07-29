//
//  JTRedEnveEntryVC.m
//  JLGT
//
//  Created by Hugo on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTRedEnveEntryVC.h"
#import "JTRedEnvePersonallVC.h"

@interface JTRedEnveEntryVC ()

@property (weak, nonatomic) IBOutlet UITextField *friendTextField;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;

@end

@implementation JTRedEnveEntryVC


- (IBAction)goClick:(UIButton *)sender {
    
    /* 获取数据 */
    NSString *name = self.friendTextField.text;
    NSLog(@"###########%@",name);
    
    /* 从sb创建控制器  */
    // 1.加载storyboard(nil = [NSBundle mainBundle])
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"JTRedEnvePersonallVC" bundle:[NSBundle mainBundle]];
    
    // 根据标示符加载控制器
    JTRedEnvePersonallVC *redVC = [sb instantiateViewControllerWithIdentifier:@"JTRedEnve"];
    redVC.friendName = name;
    
    [self.navigationController pushViewController:redVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置View颜色
    self.view.backgroundColor = LZRGBColor(243, 243, 247);
    /* 登陆按钮禁用 */
    self.goBtn.enabled = NO;
    
    /* 监听文字输入框的内容改变 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange) name:@"UITextFieldTextDidChangeNotification" object:self.friendTextField];
    
    [self setUpNavBar];
}

/* 文本框内容发生改变就会调用 */
-(void)textFieldChange
{
    // 根据文本框的长度控制登陆按钮的状态
    self.goBtn.enabled = (self.friendTextField.text.length > 0);
}

/** 设置导航栏 */
- (void)setUpNavBar
{
    
    // 设置导航条内容
    self.navigationItem.title = @"设置朋友";
    
    // 设置下一个控制器返回按钮内容
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
}

/** 设置状态栏为白色 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)test
{
    /* 100 0000.00 */
    NSString *mony = @"12";
}

@end

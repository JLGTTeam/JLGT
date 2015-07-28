//
//  JTAlipayWealthViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/24.
//  Copyright (c) 2015年 ds. All rights reserved.
//@"财富"

#import "JTAlipayWealthViewController.h"

@interface JTAlipayWealthViewController ()<UIAlertViewDelegate>

/** 弹窗*/
@property (nonatomic, strong) UIAlertView *alertView;

/** 临时按钮 */
@property (nonatomic, strong) UIButton *btn;

/** 弹框数字 */
@property (nonatomic, strong) UITextField *field;

@end

@implementation JTAlipayWealthViewController
#pragma mark -Plist懒加载
- (UIAlertView *)alertView
{
    if (_alertView == nil) {
        self.alertView = [[ UIAlertView alloc ] initWithTitle : @"请输入要修改的数字" message : nil delegate : self cancelButtonTitle : nil otherButtonTitles : @" 确定 " , nil ];
        self.alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        if (_field == nil) {
            _field = [[UITextField alloc]init];
            _field.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        }
         _field =  [self.alertView textFieldAtIndex:0];
        _field.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    }
    return _alertView;
    
}
#pragma mark - 初始化设置
- (void)viewDidLoad {
    [super viewDidLoad];
    [self alertView];
    
    self.title = @"财富";
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0];
    
}
#pragma mark - 监听按钮点击
- (IBAction)changeNumber:(UIButton *)sender {
    //拿到当前按钮的数字显示到弹框上
    self.field.placeholder = [sender titleForState:UIControlStateNormal];
    //显示中间弹框
    [self.alertView show];
    _btn = sender;
    
}
#pragma mark - 设置按钮最新的数据并显示
- ( void )alertView:( UIAlertView *)alertView clickedButtonAtIndex:( NSInteger )buttonIndex
{
    // 1 、取出文本框的文字
    NSString *text = [alertView textFieldAtIndex:0].text;
    
    //如果用户没有做任何操作，直接返回
    if(text.length == 0)return;
    //如果没有用户没有添加小数则默认添加
    if (_btn.tag == 100 || _btn.tag == 101) {
        if (![text containsString:@"."]) text = [NSString stringWithFormat:@"%@.00",text];
    }
    
    // 2 、给对应的按钮赋值
    [_btn setTitle:text forState:UIControlStateNormal];
    
    // 3 、清空临时按钮
    _btn = nil;
    _field.text = nil;
    
}

@end

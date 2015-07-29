//  JTAlipayWealthViewController.m
//  JLGT
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
         _field =  [self.alertView textFieldAtIndex:0];
        _field.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _alertView;
}
#pragma mark - 初始化 一次性设置
- (void)viewDidLoad {
    [super viewDidLoad];
    [self alertView];
    self.title = @"财富";
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:248/255.0 alpha:0.9];
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
    //  1.取出文本框的文字
    NSMutableString *strMutable = [NSMutableString stringWithString:[alertView textFieldAtIndex:0].text];

    //  2.如果用户没有做任何操作，或者 直接小数点就直接返回
    if(strMutable.length == 0 || [strMutable rangeOfString:@"."].location == 0)return;
    
    //  3.处理小数问题
    NSString * strLs = [[NSString alloc]init];// 临时字符串
    NSRange range = [strMutable rangeOfString:@"."];//  获取点的位置
    range.length = strMutable.length - range.location;//  获得小数的位数长度

    if ([strMutable containsString:@"."] && !(_btn.tag == 100 || _btn.tag == 101 || _btn.tag == 102)) [strMutable deleteCharactersInRange:range];// 没应有小数的按钮，删除小数部分
    else if ([strMutable containsString:@"."]  &&(_btn.tag == 100 || _btn.tag == 101 || _btn.tag == 102))//本该有小数的按钮
    {
        if (range.length > 3 ) [strMutable deleteCharactersInRange:NSMakeRange(range.location + 3, strMutable.length - (range.location + 3))];//小数位超出2位部分删除
        strLs = [strMutable substringFromIndex:strMutable.length -3]; //  取出小数部分
        [strMutable deleteCharactersInRange:NSMakeRange(strMutable.length - 3, 3)];//删除小数部分
    }
    
    for (NSInteger i = strMutable.length ; i > 0;i -= 3 ) {// 添加,号分隔符
        [strMutable insertString:@"," atIndex:i];
    }
   
    [strMutable deleteCharactersInRange:NSMakeRange(strMutable.length - 1 , 1)]; //删除最后一个，号
    [strMutable appendString:strLs];//添加小数到字符串最后
    
    //  4.如果没有用户没有添加小数则默认添加
    if (_btn.tag == 100 || _btn.tag == 101 || _btn.tag == 102) {
        if (![strMutable containsString:@"."]) {
            [strMutable appendString:@".00"];
        }
    }
    
    //  5.给对应的按钮赋值
    [_btn setTitle:strMutable forState:UIControlStateNormal];
    
    //  6.清空临时按钮
    _btn = nil;
    _field.text = nil;
}
@end

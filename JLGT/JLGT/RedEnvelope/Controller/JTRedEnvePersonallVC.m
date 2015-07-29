//
//  JTRedEnvePersonallVC.m
//  JLGT
//
//  Created by Hugo on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTRedEnvePersonallVC.h"
#import "UITextView+PlaceHolder.h"

@interface JTRedEnvePersonallVC ()<UITextFieldDelegate,UITextViewDelegate>

/** 发送红包按钮 */
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
/** 显示朋友名字的label */
@property (weak, nonatomic) IBOutlet UILabel *sendNameLabel;
/** 显示用户输入金额的label */
@property (weak, nonatomic) IBOutlet UILabel *showMonyLabel;
/** 金钱输入框 */
@property (weak, nonatomic) IBOutlet UITextField *monyInPutTextField;
/** 消息输入框 */
@property (weak, nonatomic) IBOutlet UITextView *message;

@end

@implementation JTRedEnvePersonallVC
- (IBAction)sendClick:(id)sender {
    NSLog(@"发红包");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航条内容
    self.navigationItem.title = @"个人红包";
    self.sendNameLabel.text = self.friendName;
    
    // 设置View颜色
    self.view.backgroundColor = LZRGBColor(243, 243, 247);
    
    /* 设置发红包按钮 */
    // 颜色
    self.sendBtn.backgroundColor = LZRGBColor(254, 206, 92);

    // 圆角
    self.sendBtn.layer.cornerRadius = 5.0;
    // 按钮字体
    [self.sendBtn.titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:18]];
    
    /* 设置输入框的键盘 */
    self.monyInPutTextField.returnKeyType = UIReturnKeyDone;
    self.message.returnKeyType = UIReturnKeyDone;
    
    // 设置金钱输入框的代理
    self.monyInPutTextField.delegate = self;
    // 设置消息输入框的代理
    self.message.delegate = self;
    // 设置消息输入框的占位文字
    [self.message addPlaceHolder:@"恭喜发财，万事如意!"];
    
    // 监听键盘退出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // 监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange) name:@"UITextFieldTextDidChangeNotification" object:self.monyInPutTextField];
}
/* 输入金额的文字改变就会来到此方法 */
-(void)textFieldChange
{
    NSString *mony = self.monyInPutTextField.text;
    CGFloat fmony = [mony floatValue];
    
    NSString *destMomy = [[NSString alloc] initWithFormat:@"￥%.2f",fmony];
    self.showMonyLabel.text = destMomy;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length < 5) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 键盘退出处理
- (void)keyboardWillHide:(NSNotification *)note {
    CGFloat ty = 0 - self.view.frame.origin.y ;
    [self changeTransformWithOffsetY:ty];
}

#pragma mark - UITextViewDelegate
/** 开始输入消息时调用--隐藏占位文字 */
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"%s",__func__);
    textView.placeHolderTextView.hidden = YES;
    CGFloat ty = -97 - self.view.frame.origin.y;
    [self changeTransformWithOffsetY:ty];
}

/** 结束输入消息时调用--显示占位文字 */
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        textView.placeHolderTextView.hidden = NO;
    }
}

/* 监听输入消息字符长度-超过24则不允许输入 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    /* 判断是否是换行建--由于不允许换行检测到就退出 */
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    } else {// 检测当前已输入文字长度-限制在24
        if (textView.text.length < 24) {
            return YES;
        } else {
            return NO;
        }
    }
}

/** 输入金额时向上平移控制器view */
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGFloat ty = -33 - self.view.frame.origin.y ;
    [self changeTransformWithOffsetY:ty];
}

/** 竖直方向平移控制器的View */
- (void)changeTransformWithOffsetY:(CGFloat)offsetY
{
    [UIView animateWithDuration:0.5 animations:^{
        // 平移整个控制器
        self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, offsetY);
    }];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}

/** 滚动就退出键盘 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    [self.view endEditing:YES];
}

/** 金额输入框的键盘点击返回按钮 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 退出键盘
    [self.view endEditing:YES];
    return YES;
}

/** 监听选择红包主题的点击*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)// 只要点了第一个就让金额输入框成为第一响应者
    {
        [self.monyInPutTextField becomeFirstResponder];
    }
    else if(indexPath.section == 2)
    {
        NSLog(@"选择红包主题");
    }
}

@end

//
//  JTAlipayConversactionViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/23.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTAlipayConversactionViewController.h"
#import "JTAlipayFriendsViewController.h"
#import "JTAlipayFriendMessageModel.h"
#import "JTAlipayFriendsMessageCell.h"
#import "JTEmojyIconView.h"

@interface JTAlipayConversactionViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** message */
@property (nonatomic,strong) NSMutableArray *messages;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (weak, nonatomic) IBOutlet UITextField *txtInput;

// 按住说话按钮
@property (weak, nonatomic) IBOutlet UIButton *btnSpeak;

@property (weak, nonatomic) IBOutlet UIButton *btnVoice;

@property (weak, nonatomic) IBOutlet UIButton *btnEmojy;

@property (weak, nonatomic) IBOutlet UIButton *btnShare;

/** 键盘按钮当前是否显示 */
@property (nonatomic,assign,getter=isKeyboardHide) BOOL KeyboardHide;
/** 键盘按钮当前所在的位置 */
@property (nonatomic,weak) UIButton *btnKeyboard;

@end

@implementation JTAlipayConversactionViewController

static NSString * const otherCell = @"friend";
static NSString * const meCell = @"me";

- (NSMutableArray *)messages
{
    if(_messages == nil)
    {
        _messages = [NSMutableArray array];
        
        // 加载plist数据
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        for (NSDictionary *dict in plistArray) {
            [_messages addObject:[JTAlipayFriendMessageModel alipayFriendMessageModelWithDict:dict]];
        }
    }
    
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"朋友";
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithTitle:@"红包" style:UIBarButtonItemStyleDone target:self action:@selector(tempHongbao)];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"借条" style:UIBarButtonItemStyleDone target:self action:@selector(tempJietiao)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"朋友列表" style:UIBarButtonItemStyleDone target:self action:@selector(tempFriend)];
    self.navigationItem.rightBarButtonItems = @[item0, item1, item2];
    
    [self setUpTableView];
    
    // 背景颜色
    self.tableView.backgroundColor = LZRGBColor(241, 241, 241);
    
    self.txtInput.delegate = self;
    
    // 监听键盘发出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification: ) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    JTEmojyIconView *emojyView = [JTEmojyIconView emojyIconView];
    
    emojyView.frame = CGRectMake(0, 100, self.view.jt_width, 230);
    [self.view addSubview:emojyView];
}

- (void)setUpTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)tempHongbao {
    JTLog(@"发红包");
}

- (void)tempJietiao {
    JTLog(@"打借条");
}

- (void)tempFriend {
    JTAlipayFriendsViewController *friends = [[JTAlipayFriendsViewController alloc] init];
    [self.navigationController pushViewController:friends animated:YES];
}

#pragma mark 键盘相关方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 取消编辑
    [self.view endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification
{
    CGRect keyboardBegin = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect keyboardEnd = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 键盘高度
    CGFloat keyboardH = keyboardEnd.origin.y - keyboardBegin.origin.y;
    // 平移整个控制器
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, keyboardH);
}

// 点击+
- (IBAction)btnMessageAddClick:(UIButton *)sender {
    [self btnKeyBoardShow:sender];
}

// 点击表情
- (IBAction)btnEmojiClick:(UIButton *)sender {
    [self btnKeyBoardShow:sender];
    
    if(1)
    {
        // 表情
        [sender setImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"emoji_2"] forState:UIControlStateHighlighted];
        // 显示键盘
    }
    else
    {
        // 键盘
        [sender setImage:[UIImage imageNamed:@"keyboard"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"keyboard_2"] forState:UIControlStateHighlighted];
        // 显示表情
    }
    
    // 输入框得到焦点
    [self.txtInput becomeFirstResponder];
}

// 点击语音
- (IBAction)btnVoiceClick:(UIButton *)sender {
    // 切换图片
    [self btnKeyBoardShow:sender];
    if(self.isKeyboardHide && self.btnKeyboard == sender)
    {
        self.txtInput.hidden = NO;
        self.btnSpeak.hidden = YES;
        // 输入框得到焦点
        [self.txtInput becomeFirstResponder];
    }
    else
    {
        self.btnKeyboard = sender;
        self.txtInput.hidden = YES;
        self.btnSpeak.hidden = NO;
        // 退出键盘
        [self.view endEditing:YES];
    }
}

// 控制键盘的显示位置
- (void)btnKeyBoardShow:(UIButton *)sender
{
    // 切换图片
    if(self.isKeyboardHide && self.btnKeyboard == sender)
    {
        self.KeyboardHide = NO;
        // 语音
        [self.btnVoice setImage:[UIImage imageNamed:@"recordBtn"] forState:UIControlStateNormal];
        [self.btnVoice setImage:[UIImage imageNamed:@"recordBtn_2"] forState:UIControlStateHighlighted];
        
        // 表情
        [self.btnEmojy setImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateNormal];
        [self.btnEmojy setImage:[UIImage imageNamed:@"emoji_2"] forState:UIControlStateHighlighted];
        
        // 分享
        [self.btnShare setImage:[UIImage imageNamed:@"toolsBtn"] forState:UIControlStateNormal];
        [self.btnShare setImage:[UIImage imageNamed:@"toolsBtn_2"] forState:UIControlStateHighlighted];
        
    }
    else
    {
        self.KeyboardHide = YES;
        self.btnKeyboard = sender;
        // 语音
        [sender setImage:[UIImage imageNamed:@"keyboard"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"keyboard_2"] forState:UIControlStateHighlighted];
    }
}


#pragma mark 数据源相关方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JTAlipayFriendMessageModel *messageModel = self.messages[indexPath.row];
    if(indexPath.row > 1)
    {
        // 判断当前时间与上一条记录时间是否相等
        JTAlipayFriendMessageModel *preMessageModel = self.messages[indexPath.row - 1];
        if(messageModel.time == preMessageModel.time)
        {
            messageModel.hideTime = YES;
        }
    }
    
    if(messageModel.type == JTAlipayFriendMessageTypeOther)
    {
        // 别人
        JTAlipayFriendsMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:otherCell];
        cell.alipayFriendMessageModel = messageModel;
        return cell;
    }
    else
    {
        // 自己
        JTAlipayFriendsMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:meCell];
        cell.alipayFriendMessageModel = messageModel;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JTAlipayFriendMessageModel *messageModel = self.messages[indexPath.row];
    return messageModel.cellH;
}

@end

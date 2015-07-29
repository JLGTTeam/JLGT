//
//  JTUnreadViewController.m
//  JLGT
//
//  Created by 敖然 on 15/7/23.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTUnreadViewController.h"
#import "JTUnreadMessageCell.h"
#import "JTUnreadMessage.h"
#import "JTUnreadMessageEditViewController.h"


@interface JTUnreadViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
/**显示未读消息的tableView*/
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**底部的工具条*/
@property (weak, nonatomic) IBOutlet UIView *toolBarView;
/**底部工具条距离父控件底部的距离*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolBarViewBottom;

/**模型数组*/
@property (nonatomic, strong) NSMutableArray *unreadMessages;
@end

@implementation JTUnreadViewController

/**--unreadMessages--懒加载*/
- (NSMutableArray *)unreadMessages
{
    if (_unreadMessages == nil)
    {
        _unreadMessages = [NSMutableArray array];
    }
    return _unreadMessages;
}

/**cell的重用标识*/
static NSString *const ID = @"unreadMessage";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JTUnreadMessageCell class]) bundle:nil] forCellReuseIdentifier:ID];
    //初始化显示未读消息的tableView
    [self setupTableView];

    //添加未读消息
    [self addUnreadMessage];
}

#pragma mark - 设置导航条的隐藏与否
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航条
    [self.navigationController setNavigationBarHidden:YES];
    //隐藏标签栏
    [self.tabBarController.tabBar setHidden:YES];
    //工具条向下移动
    self.toolBarViewBottom.constant = 0;
}

#pragma mark - 初始化显示未读消息的tableView
- (void)setupTableView
{
    self.view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //取消系统的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 添加未读消息
- (void)addUnreadMessage
{
    //创建一个模型
    JTUnreadMessage *unreadMessage = [[JTUnreadMessage alloc] init];
    unreadMessage.type = JTUnreadMessageTypePhone;
    unreadMessage.name = @"GG";
    unreadMessage.time = @"刚刚";
    unreadMessage.content = @"未接电话";
    
    JTUnreadMessage *unreadMessage1 = [[JTUnreadMessage alloc] init];
    unreadMessage1.type = JTUnreadMessageTypeWeixin;
    unreadMessage1.name = @"微信";
    unreadMessage1.time = @"刚刚";
    unreadMessage1.content = @"林涛：哈哈哈哈";
    
    [self.unreadMessages addObject:unreadMessage];
    [self.unreadMessages addObject:unreadMessage1];
}

#pragma mark - 开始截图
- (IBAction)createImage
{
    self.toolBarViewBottom.constant = -self.toolBarView.bounds.size.height;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"截图保存成功" message:@"是否继续创建？" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alertView show];
}

#pragma mark - 添加未接来电消息
- (IBAction)phoneButtonClick:(UIButton *)sender
{
    JTUnreadMessageEditViewController *editViewController = [[JTUnreadMessageEditViewController alloc] init];
    [self.navigationController pushViewController:editViewController animated:YES];
}

#pragma mark - 设置alertView提示用户操作
- (void)alertView:(nonnull UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //不继续创建截图，显示标签栏，不显示工具条
        [self.tabBarController.tabBar setHidden:NO];
        
//        [UIView animateWithDuration:1 animations:^{
//            self.toolBarViewBottom.constant = self.tabBarController.tabBar.bounds.size.height;
//        }];
    }
    else
    {
        //继续创建截图，显示工具条，不显示标签栏
        self.toolBarViewBottom.constant = 0;
    }
}

#pragma mark - tableView的数据源方法
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.unreadMessages.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    JTUnreadMessage *unreadMessage = self.unreadMessages[indexPath.row];
    JTUnreadMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.unreadMessage = unreadMessage;
    
    return cell;
}

#pragma mark - tableView的代理方法
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80;
}

@end

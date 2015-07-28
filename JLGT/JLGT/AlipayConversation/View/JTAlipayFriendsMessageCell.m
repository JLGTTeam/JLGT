//
//  JTAlipayFriendsMessageCell.m
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/25.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTAlipayFriendsMessageCell.h"
#import <Masonry.h>

@interface JTAlipayFriendsMessageCell()
@property (weak, nonatomic) IBOutlet UIButton *messageDateTime;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UIButton *message;

@end

@implementation JTAlipayFriendsMessageCell

- (void)awakeFromNib {
    // Initialization code
    
    // 初始化设置
    [self setUp];
}

- (void)setUp
{
    // 设置背景色
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    // 时间背景图片设置
    UIImage *timeImage = [UIImage imageStretchableWithNamed:@"APTimeBackground"];
    [self.messageDateTime setBackgroundImage:timeImage forState:UIControlStateNormal];
    self.messageDateTime.contentEdgeInsets = UIEdgeInsetsMake(3, 5, 3, 5);
    [self.messageDateTime setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 取消用户可交互性
    self.messageDateTime.userInteractionEnabled = NO;
    
    UIImage *messageNormalImage = [self.message backgroundImageForState:UIControlStateNormal];
    // 设置图片背景的拉伸模式
    messageNormalImage = [messageNormalImage stretchableImageWithLeftCapWidth:10 topCapHeight:30];
    [self.message setBackgroundImage:messageNormalImage forState:UIControlStateNormal];
    
    // 选中背景色设置
    UIImage *messageHLImage = [self.message backgroundImageForState:UIControlStateHighlighted];
    messageHLImage = [messageHLImage stretchableImageWithLeftCapWidth:10 topCapHeight:30];
    [self.message setBackgroundImage:messageHLImage forState:UIControlStateHighlighted];
    
    self.message.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    self.message.titleLabel.numberOfLines = 0;
}

- (void)setAlipayFriendMessageModel:(JTAlipayFriendMessageModel *)alipayFriendMessageModel
{
    _alipayFriendMessageModel = alipayFriendMessageModel;
    
    [self.messageDateTime setTitle:_alipayFriendMessageModel.time forState:UIControlStateNormal];
    // 判断时间是否隐藏显示
    self.messageDateTime.hidden = self.alipayFriendMessageModel.isHideTime;
    // 修改时间的约束
    if(self.alipayFriendMessageModel.isHideTime)
    {
        // 隐藏
        [self.messageDateTime mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
    }
    else
    {
        // 显示
        [self.messageDateTime mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@26);
        }];
    }
    
    // 根据类型判断加载图片
    if(self.alipayFriendMessageModel.type == JTAlipayFriendMessageTypeMe)
    {
        // 自己
        self.icon.image = [UIImage imageNamed:@"defaultUserIcon"];
    }
    else if(self.alipayFriendMessageModel.type == JTAlipayFriendMessageTypeOther)
    {
        // 别人
        self.icon.image = [UIImage imageNamed:@"defaultUserIcon"];
    }
    
    [self.message setTitle:self.alipayFriendMessageModel.text forState:UIControlStateNormal];
    // 强制布局
    [self.message layoutIfNeeded];
    CGFloat titleH = self.message.titleLabel.jt_height;
    [self.message mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(titleH + 20);
    }];
    // 强制布局
    [self.message layoutIfNeeded];
    
    // 实际高度计算
    CGFloat photoH = CGRectGetMaxY(self.icon.frame);
    CGFloat messageH = CGRectGetMaxY(self.message.frame);
    _alipayFriendMessageModel.cellH = MAX(photoH, messageH) + 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  JTUnreadMessageCell.m
//  JLGT
//
//  Created by Apple on 15/7/29.
//  Copyright © 2015年 ds. All rights reserved.
//

#import "JTUnreadMessageCell.h"
#import "JTUnreadMessage.h"

@interface JTUnreadMessageCell ()
/**图标*/
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/**联系人名字*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**时间*/
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**未读消息的内容*/
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/**行为提示*/
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;

@end

@implementation JTUnreadMessageCell

- (void)setUnreadMessage:(JTUnreadMessage *)unreadMessage
{
    _unreadMessage = unreadMessage;
    
    //设置图标和行为提示
    switch (unreadMessage.type)
    {
        case JTUnreadMessageTypePhone:
            self.iconImageView.backgroundColor = [UIColor blueColor];
            self.actionLabel.text = @"滑动来呼叫";
            break;
        case JTUnreadMessageTypeWeixin:
            self.iconImageView.backgroundColor = [UIColor redColor];
            self.actionLabel.text = @"滑动来回复";
            break;
        case JTUnreadMessageTypeDuanxin:
            self.iconImageView.backgroundColor = [UIColor orangeColor];
            self.actionLabel.text = @"滑动来回复";
            break;
            
        default:
            break;
    }
    
    //设置其他
    self.nameLabel.text = unreadMessage.name;
    self.timeLabel.text = unreadMessage.time;
    self.contentLabel.text = unreadMessage.content;
}

@end

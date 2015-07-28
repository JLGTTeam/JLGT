//
//  JTAlipayFriendsCell.m
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/25.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTAlipayFriendsCell.h"

@interface JTAlipayFriendsCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *lblUserName;

@property (weak, nonatomic) IBOutlet UILabel *lblMessage;

@property (weak, nonatomic) IBOutlet UILabel *lblDatetime;

@end

@implementation JTAlipayFriendsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setFriendModel:(JTAlipayFriendsModel *)friendModel
{
    _friendModel = friendModel;
    
    self.icon.image = [UIImage imageNamed:self.friendModel.alipayIcon];
    self.lblUserName.text = self.friendModel.alipayName;
    self.lblMessage.text = self.friendModel.alipayMessage;
    self.lblDatetime.text = self.friendModel.alipayDatetime;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

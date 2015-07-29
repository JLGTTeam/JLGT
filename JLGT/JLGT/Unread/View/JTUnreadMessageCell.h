//
//  JTUnreadMessageCell.h
//  JLGT
//
//  Created by Apple on 15/7/29.
//  Copyright © 2015年 ds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTUnreadMessage;
@interface JTUnreadMessageCell : UITableViewCell
/**模型属性*/
@property (nonatomic, strong) JTUnreadMessage *unreadMessage;
@end

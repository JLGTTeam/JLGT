//
//  JTUnreadMessage.h
//  JLGT
//
//  Created by Apple on 15/7/29.
//  Copyright © 2015年 ds. All rights reserved.
//

#import <Foundation/Foundation.h>

/**未读消息的类型*/
typedef enum
{
    JTUnreadMessageTypePhone,
    JTUnreadMessageTypeWeixin,
    JTUnreadMessageTypeDuanxin
} JTUnreadMessageType;

@interface JTUnreadMessage : NSObject

/**未读消息类型*/
@property (nonatomic, assign) JTUnreadMessageType type;
/**消息发送者*/
@property (nonatomic, copy) NSString *name;
/**发送时间*/
@property (nonatomic, copy) NSString *time;
/**消息内容*/
@property (nonatomic, copy) NSString *content;

/**模型对应的cell的高度*/
@property (nonatomic, assign) CGFloat cellHeight;
@end

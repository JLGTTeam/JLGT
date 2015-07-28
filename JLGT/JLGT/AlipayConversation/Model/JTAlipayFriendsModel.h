//
//  JTAlipyFriendsModel.h
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/25.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTAlipayFriendsModel : NSObject
/** 昵称、备注 */
@property (nonatomic,strong) NSString *alipayName;

/** 图像 */
@property (nonatomic,strong) NSString *alipayIcon;

/** 最新显示的消息 */
@property (nonatomic,strong) NSString *alipayMessage;

/** datetime */
@property (nonatomic,strong) NSString *alipayDatetime;
@end

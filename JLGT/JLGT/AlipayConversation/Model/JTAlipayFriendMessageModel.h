//
//  JTAlipyFriendMessageModel.h
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/25.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    JTAlipayFriendMessageTypeMe = 0,
    JTAlipayFriendMessageTypeOther
} JTAlipayFriendMessageType;

@interface JTAlipayFriendMessageModel : NSObject

/** text */
@property (nonatomic,strong) NSString *text;

/** time */
@property (nonatomic,strong) NSString *time;

/** type */
@property (nonatomic,assign) JTAlipayFriendMessageType type;

/** cellH */
@property (nonatomic,assign) CGFloat cellH;

/** isHideTime */
@property (nonatomic,assign,getter=isHideTime) BOOL hideTime;

+ (instancetype)alipayFriendMessageModelWithDict:(NSDictionary *)dict;

@end

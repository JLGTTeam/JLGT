//
//  JTAlipyFriendMessageModel.m
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/25.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTAlipayFriendMessageModel.h"

@implementation JTAlipayFriendMessageModel

+ (instancetype)alipayFriendMessageModelWithDict:(NSDictionary *)dict
{
    JTAlipayFriendMessageModel *model = [[JTAlipayFriendMessageModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end

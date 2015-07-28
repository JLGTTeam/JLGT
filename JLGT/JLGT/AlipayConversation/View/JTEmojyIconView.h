//
//  JTEmojyIcon.h
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTEmojyIconView;

@protocol JTEmojyIConViewDelegate <NSObject>

@optional
// 点击表情
- (void)emojyIconView:(JTEmojyIconView *)emojyIconView didEmojyClickWithIconName:(NSString *)iconName withImage:(UIImage *)icon;

// 发送
- (void)emojyIconViewdidSendClick:(JTEmojyIconView *)emojyIconView;

// 删除
- (void)emojyIconViewdidDeleteClick:(JTEmojyIconView *)emojyIconView;

@end


@interface JTEmojyIconView : UIView

/** delegate */
@property (nonatomic,weak) id<JTEmojyIConViewDelegate> delegate;

+ (instancetype)emojyIconView;

@end

//
//  UIView+Category.h
//  Library
//
//  Created by 敖然 on 15/5/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

/**
 *  以下方法可通过setter或者getter取值或赋值(readonly的只能取值)
 */
@property (nonatomic, assign) CGFloat jt_top;
@property (nonatomic, assign) CGFloat jt_left;
@property (nonatomic, assign, readonly) CGFloat jt_bottom;
@property (nonatomic, assign, readonly) CGFloat jt_right;
@property (nonatomic, assign) CGFloat jt_width;
@property (nonatomic, assign) CGFloat jt_height;
@property (nonatomic, assign) CGSize jt_size;

/**
 *	删除所有子对象
 */
- (void)removeAllSubviews;

@end

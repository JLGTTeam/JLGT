//
//  UIView+Category.m
//  Library
//
//  Created by 敖然 on 15/5/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)jt_left
{
    return self.frame.origin.x;
}

- (CGFloat)jt_top
{
    return self.frame.origin.y;
}

- (CGFloat)jt_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)jt_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)jt_width
{
    return self.frame.size.width;
}

- (CGFloat)jt_height
{
    return self.frame.size.height;
}

- (void)setJt_width:(CGFloat)jt_width
{
    CGRect newFrame = self.frame;
    newFrame.size.width = jt_width;
    self.frame = newFrame;
}

- (void)setJt_height:(CGFloat)jt_height
{
    CGRect newFrame = self.frame;
    newFrame.size.height = jt_height;
    self.frame = newFrame;
}

- (void)setJt_left:(CGFloat)x
{
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(x, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
    self.frame = newFrame;
}

- (void)setJt_top:(CGFloat)y
{
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(oldFrame.origin.x, y, oldFrame.size.width, oldFrame.size.height);
    self.frame = newFrame;
}

- (void)setJt_size:(CGSize)jt_size{
    CGRect frame = self.frame;
    frame.size = jt_size;
    self.frame = frame;
}

- (CGSize)jt_size {
    return self.frame.size;
}

- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end

//
//  UIView+Category.m
//  Library
//
//  Created by 敖然 on 15/5/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width
{
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

- (void)setLeft:(CGFloat)x
{
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(x, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
    self.frame = newFrame;
}

- (void)setTop:(CGFloat)y
{
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(oldFrame.origin.x, y, oldFrame.size.width, oldFrame.size.height);
    self.frame = newFrame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = CGRectMake(0, 0, size.width, size.height);
}

- (CGSize)size {
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

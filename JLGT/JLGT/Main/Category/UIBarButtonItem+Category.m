//
//  UIBarButtonItem+Category.m
//  BSBDJ
//
//  Created by 敖然 on 15/7/22.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (instancetype)itemWithImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightlightImage] forState:UIControlStateHighlighted];
    button.jt_size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[self alloc] initWithCustomView:button];
    return item;
}

@end

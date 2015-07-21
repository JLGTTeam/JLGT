//
//  UIColor+Category.h
//  Library
//
//  Created by 敖然 on 15/5/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/**
 *  用16进制颜色字符串获取UIColor类型
 *
 *  @param stringToConvert 要转成颜色的十六进制字符,以#开始
 *  @param alpha           透明度
 *
 *  @return UIColor实例
 */
+ (UIColor *)colorWithHexColor:(NSString *)stringToConvert alpha:(CGFloat)alpha;

/**
 *  同上,只是透明度默认为1
 */
+ (UIColor *)colorWithHexColor:(NSString *)stringToConvert;

/**
 *  获取一个随机的颜色
 */
+ (UIColor *)randomColor;

@end

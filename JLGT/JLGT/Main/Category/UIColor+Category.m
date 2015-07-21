//
//  UIColor+Category.m
//  Library
//
//  Created by 敖然 on 15/5/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)colorWithHexColor:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor whiteColor];

    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHexColor:(NSString *)stringToConvert {
    return [UIColor colorWithHexColor:stringToConvert alpha:1.0f];
}

+ (UIColor *)randomColor {
    CGFloat red   = arc4random_uniform(256) / 255.f;
    CGFloat green = arc4random_uniform(256) / 255.f;
    CGFloat blue  = arc4random_uniform(256) / 255.f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
}



@end

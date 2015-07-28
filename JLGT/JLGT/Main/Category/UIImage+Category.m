//
//  UIImage+LPYImage.m
//  01-彩票
//
//  Created by 刘蒲艳 on 15/6/27.
//  Copyright (c) 2015年 liupuyan. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (LPYImage)
+(instancetype)imageRenderingModeAlwaysOriginalNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (instancetype)imageStretchableWithNamed:(NSString *)name
{
    // 设置背景颜色
    UIImage *image = [UIImage imageNamed:name];
    // 设置图片拉伸部分
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return image;
}

- (instancetype) imageStretchable
{
    return [self stretchableImageWithLeftCapWidth:self.size.width * 0.5 topCapHeight:self.size.height * 0.5];
}
@end

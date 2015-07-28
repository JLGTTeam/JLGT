//
//  UIImage+LPYImage.h
//  01-彩票
//
//  Created by 刘蒲艳 on 15/6/27.
//  Copyright (c) 2015年 liupuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
/**
 *  图片显示原来的内容，不被渲染
 *
 *  @return 返回修改后的图片
 */
+ (instancetype) imageRenderingModeAlwaysOriginalNamed:(NSString *)name;

/**
 *  图片中间部分拉伸
 *
 *  @param name 图片名
 *
 *  @return 返回修改后的图片
 */
+ (instancetype) imageStretchableWithNamed:(NSString *)name;

- (instancetype) imageStretchable;

@end

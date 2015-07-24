//
//  UIBarButtonItem+Category.h
//  BSBDJ
//
//  Created by 敖然 on 15/7/22.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)
+ (instancetype)itemWithImage:(NSString *)imageName hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action;
@end

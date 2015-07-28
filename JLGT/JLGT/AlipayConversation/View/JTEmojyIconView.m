//
//  JTEmojyIcon.m
//  JLGT
//
//  Created by 刘蒲艳 on 15/7/28.
//  Copyright (c) 2015年 ds. All rights reserved.
//

#import "JTEmojyIconView.h"

// 每一行展示的总数
#define rowCount  3
// 每一列展示的总数
#define colCount  7

@interface JTEmojyIconView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *emojyScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIScrollView *emojyTitleScrollView;

/** emojy */
@property (nonatomic,strong) NSMutableDictionary *emojyContent;

@end

@implementation JTEmojyIconView
- (NSMutableDictionary *)emojyContent
{
    if(_emojyContent == nil)
    {
        _emojyContent = [NSMutableDictionary dictionary];
        // 加载plist文件
        NSDictionary *tmp = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"expression.plist" ofType:nil]];
        [_emojyContent addEntriesFromDictionary:tmp];
    }
    
    return _emojyContent;
}

- (void)awakeFromNib
{
    // 基本设置
    self.emojyScrollView.showsHorizontalScrollIndicator = NO;
    self.emojyScrollView.showsVerticalScrollIndicator = NO;
    self.emojyScrollView.pagingEnabled = YES;
    self.emojyScrollView.delegate = self;
    
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.userInteractionEnabled = NO;

    // 加载表情
    [self addEmojyContent];
    [self addEmojyTitle];
}

+ (instancetype)emojyIconView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)addEmojyContent
{
    // 每一页展示的总数
    NSInteger pageCount = rowCount * colCount - 1;
    // 需要的页数
    NSInteger pages = self.emojyContent.count % pageCount == 0 ? self.emojyContent.count / pageCount : self.emojyContent.count / pageCount + 1;
    for (NSInteger i = 0; i < pages; i++) {
        UIView *view = [[UIView alloc] init];
        
        [self.emojyScrollView addSubview:view];
        
        // 添加内部表情
        // 开始索引
        NSInteger startIndex = i * pageCount;
        // 结束索引
        NSInteger endIndex = (i + 1) * pageCount > self.emojyContent.count ? self.emojyContent.count : (i + 1) * pageCount;
        
        for(NSInteger j = startIndex; j < endIndex; j++)
        {
            // 获得表情对应的key
            NSString *value = self.emojyContent.allValues[j];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            value = [value substringToIndex:[value rangeOfString:@"@2x.png"].location];
            [btn setImage:[UIImage imageNamed:value] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnEmojyClick:) forControlEvents:UIControlEventTouchUpInside];
            // tag从1开始计算，避免跟系统默认的0冲突
            btn.tag = j + 1;
            
            [view addSubview:btn];
        }
        
        // 删除
        UIButton *lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lastBtn setImage:[UIImage imageNamed:@"DeleteEmoticonBtn_ios7"] forState:UIControlStateNormal];
        [lastBtn addTarget:self action:@selector(btnDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:lastBtn];
    }
    
    // 设置分页相关内容
    self.pageControl.numberOfPages = pages;
    
    self.emojyScrollView.contentSize = CGSizeMake(self.jt_width * pages, 0);
}

- (void)layoutSubviews
{
    CGFloat viewW = self.emojyScrollView.jt_width;
    CGFloat viewH = self.emojyScrollView.jt_height;
    CGFloat emojyWH = 30;
    CGFloat marginW = (viewW - emojyWH * colCount) / (colCount + 1);
    CGFloat marginH = (viewH - emojyWH * rowCount) / (rowCount + 1);
    NSInteger pages = self.emojyScrollView.subviews.count;
    for(int i = 0; i < pages; i++)
    {
        UIView *view = self.emojyScrollView.subviews[i];
        view.frame = CGRectMake(i * viewW, 0, viewW, viewH);
        for (int j = 0; j < view.subviews.count; j++) {
            UIButton *btn = view.subviews[j];
            CGFloat x = marginW + (emojyWH + marginW) * (j / rowCount);
            CGFloat y = marginH + (emojyWH + marginH) * (j % rowCount);
            btn.frame = CGRectMake(x, y, emojyWH, emojyWH);
        }
    }
}

- (void)addEmojyTitle
{
    
}

// 设置当前滚动的页数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = (NSInteger)(scrollView.contentOffset.x / self.jt_width + 0.5);
    self.pageControl.currentPage = currentPage;
}

- (void)btnEmojyClick:(UIButton *)sender
{
    // 获取按钮对应的内容在字典中的存储
    NSInteger index = sender.tag - 1;
    NSString *key = self.emojyContent.allKeys[index];
    NSString *value = self.emojyContent.allValues[index];
    if([self.delegate respondsToSelector:@selector(emojyIconView:didEmojyClickWithIconName:withImage:)])
    {
        [self.delegate emojyIconView:self didEmojyClickWithIconName:key withImage:[UIImage imageNamed:value]];
    }
}

// 删除
- (void)btnDeleteClick:(UIButton *)sender
{
    if([self.delegate respondsToSelector:@selector(emojyIconViewdidDeleteClick:)])
    {
        [self.delegate emojyIconViewdidDeleteClick:self];
    }
}

// 发送
- (IBAction)btnSendClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(emojyIconViewdidSendClick:)])
    {
        [self.delegate emojyIconViewdidSendClick:self];
    }
}

@end

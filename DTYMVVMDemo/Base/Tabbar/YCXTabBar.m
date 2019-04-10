//
//  YCXTabBar.m
//  自定义 tabbar
//
//  Created by 李旭杰 on 2017/7/11.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "YCXTabBar.h"
#import "HLAutoViewDefine.h"

@interface YCXTabBar ()

/**
 凸起摁扭
 */
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UILabel *centerLabel;

@end
@implementation YCXTabBar

- (void)setFrame:(CGRect)frame
{
    if (self.superview && CGRectGetMaxY(self.superview.bounds) != CGRectGetMaxY(frame)) {
        frame.origin.y = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupTabBarUI];
    }
    return self;
}

- (void)setupTabBarUI{
    
    UIView * centerView = [[UIView alloc] init];
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 5.0f, self.frame.size.height)];
    UILabel * centerLabel = [[UILabel alloc] init];
    centerLabel.text = @"云车行";
    centerLabel.font = [UIFont systemFontOfSize:13];
    centerLabel.textColor = colorWithHexString(@"#666666ff");
    centerLabel.textAlignment = NSTextAlignmentCenter;
    
    
//    [startBtn setTitle:@"云车行" forState:UIControlStateNormal];
//    [startBtn setTitle:@"云车行" forState:UIControlStateHighlighted];
    [startBtn setImage:[UIImage imageNamed:@"tab_drive"] forState:UIControlStateNormal];
    [startBtn setImage:[UIImage imageNamed:@"tab_drive"] forState:UIControlStateHighlighted];
    
    // 监听摁扭的点击事件
    [startBtn addTarget:self action:@selector(startDrivingAction) forControlEvents:UIControlEventTouchUpInside];
    
    // 图片自适应大小
    [startBtn sizeToFit];
    
    
    [centerView addSubview:centerLabel];
    [centerView addSubview:startBtn];
    [self addSubview:centerView];
    
    // 属性关联
    self.startBtn = startBtn;
    self.centerView = centerView;
    self.centerLabel = centerLabel;
    
}

- (void)startDrivingAction{
    
    if ([self.delegate respondsToSelector:@selector(didSelectedStartButtonOpreation)]) {
        [self.delegate didSelectedStartButtonOpreation];
    }
}

// 调整子控件布局
- (void)layoutSubviews{
    [super layoutSubviews];
    // 每个 item 的宽度
    CGFloat itemWidth = self.frame.size.width / 5.0f;
    
    
//    int x = 0;
//    if (kDevice_Is_iPhoneX) {
//        x = 17;
//    }
    
    self.centerView.frame = CGRectMake(itemWidth * 2, 5, itemWidth, self.frame.size.height);
    // 设置摁扭的中心
    self.startBtn.hly_centerX = self.centerView.frame.size.width * .5f;
//    self.startBtn.hly_centerY = self.centerView.frame.size.height * .5f - x;
    self.centerLabel.frame = CGRectMake(0, self.startBtn.frame.size.height+self.startBtn.frame.origin.y+2, itemWidth, 15);
    self.centerLabel.hly_centerX = self.centerView.frame.size.width * .5f;
    
    // 记录遍历道德索引值
    NSInteger index = 0;
    
    // 遍历子控件
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            // 给系统的摁扭设置宽度
            subView.hly_width = itemWidth;
            // 设置UITabBarButton的x坐标
            subView.hly_left = (CGFloat)index * itemWidth;
            // 记录索引
            index++;
            // 如果是第二个UITabBarButton需要加上中间一个中间摁扭的宽度
            if (index == 2) {
                index++;
            }
        }
    }
}

@end

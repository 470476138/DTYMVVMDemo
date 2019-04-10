//
//  UIImage+Extension.h
//  ycxmj
//
//  Created by 马佳 on 16/5/10.
//  Copyright © 2016年 ycx.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleAndCut)
- (UIImage *)imageByScalingToMaxSize;
+ (UIImage *)createImageWithColor:(UIColor *)color;
@end

//
//  UIViewController+BaseViewController.m
//  DTYMVVMDemo
//
//  Created by 董天燚 on 2019/4/10.
//  Copyright © 2019 董天燚. All rights reserved.
//

#import "UIViewController+BaseViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (BaseViewController)

+(void)load{
    static dispatch_once_t onceTonken;
    dispatch_once(&onceTonken, ^{
        [self zm_swizzleInstanceMethodWithSrcClass:[self class]
                                            srcSel:@selector(viewWillAppear:)
                                       swizzledSel:@selector(zm_ViewWillAppear:)];;
    });
}

- (void)zm_ViewWillAppear:(BOOL)animated{
    //此处调用自己其实就是调用UIViewController的viewWillAppear的原生实现方法。
    [self zm_ViewWillAppear:animated];
    //可以统一调整布局、添加统计代码等等
    self.view.backgroundColor = [UIColor orangeColor];
}

/**
 交换两个对象方法的实现
 
 @param srcClass 被替换方法的类
 @param srcSel 被替换的方法编号
 @param swizzledSel 用于替换的方法编号
 */
+ (void)zm_swizzleInstanceMethodWithSrcClass:(Class)srcClass
                                      srcSel:(SEL)srcSel
                                 swizzledSel:(SEL)swizzledSel{
    
    Method srcMethod = class_getInstanceMethod(srcClass, srcSel);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSel);
    if (!srcClass || !srcMethod || !swizzledMethod) return;
    
    //加一层保护措施，如果添加成功，则表示该方法不存在于本类，而是存在于父类中，不能交换父类的方法,否则父类的对象调用该方法会crash；添加失败则表示本类存在该方法
    BOOL addMethod = class_addMethod(srcClass, srcSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (addMethod)
    {
        //再将原有的实现替换到swizzledMethod方法上，从而实现方法的交换，并且未影响到父类方法的实现
        class_replaceMethod(srcClass, swizzledSel, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
    }else
    {
        method_exchangeImplementations(srcMethod, swizzledMethod);
    }
}


/**
 交换两个类方法的实现
 
 @param srcClass 被替换方法的类
 @param srcSel 被替换的方法编号
 @param swizzledSel 用于替换的方法编号
 */
+ (void)zm_swizzleClassMethodWithSrcClass:(Class)srcClass
                                   srcSel:(SEL)srcSel
                              swizzledSel:(SEL)swizzledSel{
    
    Method srcMethod = class_getClassMethod(srcClass, srcSel);
    Method swizzledMethod = class_getClassMethod([self class], swizzledSel);
    if (!srcClass || !srcMethod || !swizzledMethod) return;
    
    //注意：类方法是存在于元类中，所以要添加到元类
    srcClass = objc_getMetaClass(class_getName(srcClass));
    BOOL addMethod = class_addMethod(srcClass, srcSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (addMethod)
    {
        class_replaceMethod(srcClass, swizzledSel, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
    }else
    {
        method_exchangeImplementations(srcMethod, swizzledMethod);
    }
}

@end

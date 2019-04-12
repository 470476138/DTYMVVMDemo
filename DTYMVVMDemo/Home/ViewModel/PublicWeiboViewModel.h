//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTestYTKBRequest.h"
#import "PublicCellModel.h"
typedef NS_ENUM (NSInteger, WeboRequsetType) {
    ListRequest,
    Other //扩充
};
typedef void (^ReturnValueBlockType) (id returnValue, WeboRequsetType);

@protocol PublicWeiboViewModelRequstDelegate <NSObject>

-(void)requestFailed:(__kindof YTKBaseRequest *)request;

-(void)handelRequestData:(id)returnValue reqeustType:(WeboRequsetType)type;

@end

@interface PublicWeiboViewModel : NSObject

@property (nonatomic,weak) id<PublicWeiboViewModelRequstDelegate> delegate;
/**
 获取围脖列表
 */
- (void)fetchPublicWeiBo;

@end

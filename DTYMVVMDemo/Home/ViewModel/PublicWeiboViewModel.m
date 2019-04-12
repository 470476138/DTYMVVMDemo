//
//  PublicWeiboViewModel.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicWeiboViewModel.h"
//#import "PublicListModel.h"


@interface PublicWeiboViewModel()<YTKRequestDelegate>
@property (copy, nonatomic) NSArray<PublicCellModel *> *publicModelArray;
@end

@implementation PublicWeiboViewModel

/**
 获取公共微博
 */
- (void)fetchPublicWeiBo {
    MyTestYTKBRequest * request = [[MyTestYTKBRequest alloc] initWithCount:@"100"];
    request.delegate = self;
    [request start];
}

//- (void)otherDataFetch {
//     self.returnBlock(@"其他数据处理", Other);
//}

/**
 获取到正确的数据，对正确的数据进行处理

 @param returnValue 返回成功后的值
 */
-(void)requestFinished:(__kindof YTKBaseRequest *)request{
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *publicModelArray = request.responseJSONObject[STATUSES];
    NSMutableArray *cellViewModels = [[NSMutableArray alloc] initWithCapacity:publicModelArray.count];
    for (int i = 0; i < publicModelArray.count; i ++) {
        PublicCellModel *cellViewModel = [[PublicCellModel alloc] initWithDic:publicModelArray[i]];
        [cellViewModels addObject:cellViewModel];
    }
//    self.returnBlock(cellViewModels, ListRequest);
    if (self.delegate) {
        [self.delegate handelRequestData:cellViewModels reqeustType:ListRequest];
    }
    self.publicModelArray = [[NSArray alloc] initWithArray:cellViewModels];
}

/**
 对网路异常进行处理
 */
-(void)requestFailed:(__kindof YTKBaseRequest *)request{
//    self.failureBlock();
    if (self.delegate) {
        [self.delegate requestFailed:request];
    }
}

- (void)dealloc
{
    DDLog(@"PublicWeiboViewModel - 释放");
}

@end

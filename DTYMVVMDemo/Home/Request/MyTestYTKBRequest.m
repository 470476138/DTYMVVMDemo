//
//  MyTestYTKBRequest.m
//  MVVMTest
//
//  Created by 董天燚 on 2019/4/3.
//  Copyright © 2019 董天燚. All rights reserved.
//

#import "MyTestYTKBRequest.h"

@implementation MyTestYTKBRequest{
    NSString * _count;
}

- (id)initWithCount:(NSString *)count{
    self = [super self];
    if (self) {
        _count = count;
    }
    return self;
}

- (NSString *)requestUrl{
    return REQUESTPUBLICURL;
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (id)requestArgument{
    return @{
             TOKEN:ACCESSTOKEN,
             COUNT:_count
             };
}

//#pragma mark - 验证返回的json
//- (id)jsonValidator{
//    return @{
//             STATUSES:@[
//                     @{
//                         USER:@{
//                               UID:[NSString class]
//                               },
//                            WEIBOID:[NSString class]}
//                     ]
//             };
//}

////设置一个3分钟的缓存，3分钟内调用调Api的start方法，实际上并不会发送真正的请求。
//- (NSInteger)cacheTimeInSeconds {
//    // cache 3 minutes, which is 60 * 3 = 180 seconds
//    return 60 * 3;
//}
////使用useCDN 地址请求
//- (BOOL)useCDN {
//    return YES;
//}
//
////上传文件 我们可以通过覆盖 constructingBodyBlock 方法，来方便地上传图片等附件，如下是一个示例：
//- (AFConstructingBlock)constructingBodyBlock {
//    return ^(id<AFMultipartFormData> formData) {
//        NSData *data = UIImageJPEGRepresentation(_image, 0.9);
//        NSString *name = @"image";
//        NSString *formKey = @"image";
//        NSString *type = @"image/jpeg";
//        [formData appendPartWithFileData:data name:formKey fileName:name mimeType:type];
//    };
//}

@end

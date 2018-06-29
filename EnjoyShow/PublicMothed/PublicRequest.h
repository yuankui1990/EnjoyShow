//
//  PublicRequest.h
//  EnjoyShow
//
//  Created by 达联 on 2018/6/29.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class UploadParam;
/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};

@interface PublicRequest : NSObject


/**
 *
 *URLString       请求地址
 *parameters      请求参数
 *success         成功回调
 *failure         失败回调
 *
 */
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure;
/**
 *
 *URLString       请求地址
 *parameters      请求参数
 *success         成功回调
 *failure         失败回调
 *
 */
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure;
/**
 *
 *URLString       请求地址
 *parameters      请求参数
 *type            请求类型
 *success         成功回调
 *failure         失败回调
 *
 */
+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure;









@end

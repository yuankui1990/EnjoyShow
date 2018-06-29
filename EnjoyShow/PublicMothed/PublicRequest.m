//
//  PublicRequest.m
//  EnjoyShow
//
//  Created by 达联 on 2018/6/29.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "PublicRequest.h"

@implementation PublicRequest

+ (PublicRequest *)sharRequest {
    static PublicRequest *request = nil;
    if (!request) {
        request = [[PublicRequest alloc] init];
    }
    return request;
}



#pragma mark -- GET请求 --
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
                 failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    /**
     *  请求超时的时间
     */
    manager.requestSerializer.timeoutInterval = 30;
    [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST请求 --
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
                  failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (resultDict[@"resultCode"]) {
            if (success) {
                success(resultDict);
            }
        } else if (resultDict[@"code"]) {
            if (success) {
                success(resultDict);
            }
        } else {
            if (failure) {
                failure(nil);
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST/GET网络请求 --
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
                     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }
}







@end

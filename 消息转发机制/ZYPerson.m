//
//  ZYPerson.m
//  消息转发机制
//
//  Created by zy on 16/5/4.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYPerson.h"
#import <objc/runtime.h>
#import "ZYChildren.h"

@implementation ZYPerson

/**
 1.方法的动态解析
 对当前类添加一个方法
 */
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"方法的动态解析");
//    // 指定对某一个方法的动态解析
//    NSString *selName = NSStringFromSelector(sel);
//    if ([selName isEqualToString:@"testMethod"]) {
//        // 动态的添加一个方法
//        class_addMethod([self class], @selector(testMethod), (IMP)newTestMethod, "v@:");
//        return YES;
//    }
//    return NO;
//}
//
//void newTestMethod()
//{
//    NSLog(@"%s", __func__);
//}


/*
 2.备用接收者
 */

// - (id)forwardingTargetForSelector:(SEL)aSelector
// {
//     NSLog(@"备用接收者");
// // 指定对某一个对象来执行方法
//     NSString *selName = NSStringFromSelector(aSelector);
//     if ([selName isEqualToString:@"testMethod"]) {
// 
//         return [ZYChildren new];
//     }
//     return [super forwardingTargetForSelector:aSelector];;
// }

/**
 3.完整的消息转发
 */
// 我们首先要通过, 指定方法签名，若返回nil，则表示不处理。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"指定方法签名");
    NSString *selName = NSStringFromSelector(aSelector);
    if ([selName isEqualToString:@"testMethod"]) {
        
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 通过anInvocation对象做很多处理，比如修改实现方法，修改响应对象等
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"%s", __func__);
    // 改变响应对象
    //    [anInvocation invokeWithTarget:[SXTPig new]];
    // 改变响应方法
    //    [anInvocation setSelector:@selector(newTestMethod1)];
    
    // 改变响应对象并改变响应方法
    [anInvocation setSelector:@selector(newTestMethod)];
    [anInvocation invokeWithTarget:[ZYChildren new]];
}

- (void)newTestMethod1
{
    NSLog(@"%s", __func__);
}

// 消息没发实现会调用这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"哈哈哈哈：%@", NSStringFromSelector(aSelector));
}

@end



























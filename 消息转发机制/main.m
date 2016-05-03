//
//  main.m
//  消息转发机制
//
//  Created by zy on 16/5/4.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "ZYPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ZYPerson *p = [ZYPerson new];
        
        [p performSelector:@selector(testMethod)];
    }
    return 0;
}

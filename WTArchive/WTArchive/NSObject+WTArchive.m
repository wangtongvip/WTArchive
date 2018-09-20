//
//  NSObject+WTArchive.m
//  WTArchive
//
//  Created by WT on 2018/9/19.
//  Copyright © 2018年 王通. All rights reserved.
//

#import "NSObject+WTArchive.h"
#import <objc/runtime.h>

@implementation NSObject (WTArchive)

/**
 *  unarchive
 */
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [self init];
    if (self) {
        unsigned int ivarsCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &ivarsCount);
        for (int i = 0; i < ivarsCount; i++) {
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

/**
 *  archive
 */
- (void)encodeWithCoder:(NSCoder *)coder {
    unsigned int ivarsCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &ivarsCount);
    for (int i = 0; i < ivarsCount; i++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}

@end

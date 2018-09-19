//
//  Car.h
//  WTArchive
//
//  Created by WT on 2018/9/19.
//  Copyright © 2018年 王通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSString *brand;
@property (nonatomic, copy) NSString *color;

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

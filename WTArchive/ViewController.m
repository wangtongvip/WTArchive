//
//  ViewController.m
//  WTArchive
//
//  Created by WT on 2018/9/19.
//  Copyright © 2018年 王通. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

#define DOCUMENTSDIR ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])
#define FILENAME @"/myCar"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //归档测试
    [self archiveTest];
    
    //解档测试
//    [self unarchiveTest];
}

/**
 *  archive
 */
- (void)archiveTest {
    //创建需要归档的类
    Car *car = [[Car alloc] init];
    car.brand = @"BMW";
    car.color = [UIColor redColor];
    
    /* 此处代码展示类对象的属性中包含其它类对象的情况
    Car *subCar = [[Car alloc] init];
    subCar.brand = @"Toyota";
    subCar.color = [UIColor blackColor];
    car.subCar = subCar;
     */
    
    //归档文件路径
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    
    //归档
    [NSKeyedArchiver archiveRootObject:car toFile:filePath];
    
    NSLog(@"%@", filePath);
}

/**
 *  unarchive
 */
- (void)unarchiveTest {
    //解档文件路径
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    
    //解档
    Car *car = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"\nMy car brand is : >%@<,\nmy car color is : >%@<\nmy car subCar is : >%@<,\n\tmy car subCar.brand is : >%@<,\n\tmy car subCar.color is : >%@<",car.brand, car.color, car.subCar, car.subCar.brand, car.subCar.color);
}


@end

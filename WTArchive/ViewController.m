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
    [self archiveTest];
//    [self unarchiveTest];
}

/**
 *  archive
 */
- (void)archiveTest {
    Car *car = [[Car alloc] init];
    car.brand = @"BMW";
    car.color = @"red";
    
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    [NSKeyedArchiver archiveRootObject:car toFile:filePath];
    
    NSLog(@"%@", filePath);
}

/**
 *  unarchive
 */
- (void)unarchiveTest {
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    Car *car = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"My car brand is : >%@<, my car color is : >%@<",car.brand, car.color);
}


@end

# WTArchive

### description
类对象进行归档解档的工具

### step
1. 将`NSObject+Archive.h`和 `NSObject+Archive.m`直接放入你的项目中。
1. 无需引入头文件或进行额外配置，使用`NSKeyedArchiver`和`NSKeyedUnarchiver`方法即可对类对象进行归档解档操作。

### look here
将step1中的的文件放入项目后，你就可以使用归解档的方法愉快地玩耍了

对类归档

    //创建需要归档的类
    Car *car = [[Car alloc] init];
    car.brand = @"BMW";
    car.color = [UIColor redColor];
    
    //归档文件路径
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    
    //归档
    [NSKeyedArchiver archiveRootObject:car toFile:filePath];

对类解档

    //解档文件路径
    NSString *filePath = [DOCUMENTSDIR stringByAppendingPathComponent:FILENAME];
    
    //解档
    Car *car = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];

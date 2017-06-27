//
//  ViewController.m
//  demo_MRC_ARC_BLOCK
//
//  Created by  huzhongyin on 17/6/27.
//  Copyright © 2017年 LanGe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //__NSGlobalBlock__ 全局区的 (没有引用外部变量)
    void (^DemoBlock)() = ^{
        NSLog(@"DemoBlock");
    };
    NSLog(@"%@",DemoBlock);
    
    int a = 6;
    //__NSStackBlock__ 栈区 (内部使用了外部变量)(MRC模式下)
    void (^DemoBlock2)() = ^{
        NSLog(@"DemoBlock2 %d",a);
    };
    NSLog(@"DemoBlock2 %@",DemoBlock2);
    
    //__NSMallocBlock__ 堆区 ([DemoBlock2 copy]后Block存放在堆区)
    NSLog(@"DemoBlock2.Copy %@",[DemoBlock2 copy]);
    
    void (^DemoBLock3)() = [DemoBlock2 copy];
    NSLog(@"DemoBlock3 %@",DemoBLock3);
    //DemoBlock内部没有调用外部变量时存放在全局区(ARC和MRC下均是)
    //DemoBlock2使用了外部变量,这种情况也正式我们平时所常用的方式,Block的内存地址显示在栈区,栈区的特点就是创建的对象随时可能被销毁,一旦被销毁后续再次调用空对象就可能会造成程序崩溃,在对block进行copy后,block存放在堆区.所以在使用Block属性时使用Copy修饰,而在ARC模式下,系统也会默认对Block进行copy操作
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

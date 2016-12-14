//
//  ViewController.m
//  KVCAndKVODemo
//
//  Created by 朱佳男 on 9/22/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "Students.h"
#import "Course.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Students *student = [[Students alloc]init];
    [student setValue:@"张三" forKey:@"name"];
    NSString *name = [student valueForKey:@"name"];
    
    Course *course = [[Course alloc]init];
    [course setValue:@"语文" forKey:@"courseName"];
    [student setValue:course forKey:@"course"];
    NSString *coursename = [student valueForKeyPath:@"course.courseName"];
    
    [student setValue:@"88" forKey:@"point"];
    NSString *point = [student valueForKey:@"point"];
    NSLog(@"学生名字叫:%@,选修的科目为:%@,期末考试的分数为%@",name,coursename,point);

    Students *student1 = [[Students alloc]init];
    Students *student2 = [[Students alloc]init];
    Students *student3 = [[Students alloc]init];
    [student1 setValue:@"65" forKey:@"point"];
    [student2 setValue:@"77" forKey:@"point"];
    [student3 setValue:@"88" forKey:@"point"];
    NSArray *studentsArr = @[student1,student2,student3];
    [student setValue:studentsArr forKey:@"otherStudent"];
    NSLog(@"其他学生的成绩%@",[student valueForKeyPath:@"otherStudent.point"]);
    NSLog(@"共有多少个学生%@",[student valueForKeyPath:@"otherStudent.@count"]);
    NSLog(@"最高成绩是%@",[student valueForKeyPath:@"otherStudent.@max.point"]);
    NSLog(@"最低成绩是%@",[student valueForKeyPath:@"otherStudent.@min.point"]);
    NSLog(@"平均成绩是%@",[student valueForKeyPath:@"otherStudent.@avg.point"]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
        NSError * error;
        NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"call back, the data is: %@", data);
            });
        } else {
            NSLog(@"error when download:%@", error);
        }
    });
//    //后台执行
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//    });
//    //主线程执行
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//    });
//    //一次性执行
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//    //延迟两秒执行
//    double delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds*NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^{
//        
//    });
//    //自定义dispatch_queue_t
//    dispatch_queue_t urls_queue = dispatch_queue_create("www.baidu.com", NULL);
//    dispatch_async(urls_queue, ^{
//        
//    });
//    //合并汇总结果
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        //并行执行的线程1
//    });
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        //并行执行的线程2
//    });
//    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//        //汇总结果
//    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

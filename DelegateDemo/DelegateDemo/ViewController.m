//
//  ViewController.m
//  DelegateDemo
//
//  Created by 朱佳男 on 9/18/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController ()<BViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changeCorlor:(NSString *)string
{
    if ([string isEqualToString:@"a"]) {
        NSLog(@"1");
    }else if ([string isEqualToString:@"b"])
    {
        NSLog(@"2");
    }else if ([string isEqualToString:@"c"])
    {
        NSLog(@"3");
    }else
    {
        NSLog(@"4");
    }
}
- (IBAction)nextPageBtnClick:(id)sender {
    BViewController *view = [[BViewController alloc]init];
    [view makeChangeColor:^(NSString *string) {
        
    }];
    
    view.delegate = self;

    [self presentViewController:view animated:NO completion:^{
        
    }];
}
@end

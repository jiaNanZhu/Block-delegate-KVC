//
//  ViewController.m
//  BlockDemo
//
//  Created by 朱佳男 on 9/23/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //定义一个无参五返回值的block
    void (^printBlock)() = ^(){
        printf("no number\n");
    };
    printBlock();
    
    int mutiplier = 7;
    //定义名为myBlock的代码块，返回值类型为int
    int (^myBlock)(int) = ^(int num){
        return num*mutiplier;
    };
    
    printf("newMutiplier is %d\n",myBlock(3));
    
    
    printNumBlock(3);
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(id)sender {
    NextViewController *view = [NextViewController new];
    view.nextViewControllerBlock = ^(NSString *tfTextVStr){
        self.topLabel.text = tfTextVStr;
    };
    [self presentViewController:view animated:NO completion:^{
        
    }];
    
}
//定义一个有参无返回的block
void (^printNumBlock)(int) = ^(int num){
    printf("int number is %d",num);
};
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  BViewController.m
//  DelegateDemo
//
//  Created by 朱佳男 on 9/18/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import "BViewController.h"
@interface BViewController()<UITextFieldDelegate>

@end
@implementation BViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.textF.delegate = self;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textF resignFirstResponder];
    return YES;
}
- (IBAction)backBtnClick:(id)sender {
    self.changeColorBlock(self.textF.text);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)changeBtnClick:(id)sender
{
    if ([_delegate respondsToSelector:@selector(changeCorlor:)]) {
        [self.delegate changeCorlor:self.textF.text];
    }
}
@end

//
//  BViewController.h
//  DelegateDemo
//
//  Created by 朱佳男 on 9/18/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^changeColor)(NSString *);
@protocol BViewControllerDelegate<NSObject>
-(void)changeCorlor:(NSString *)string;
@end
@interface BViewController : UIViewController
@property (nonatomic ,copy)changeColor changeColorBlock;
@property (weak, nonatomic) IBOutlet UITextField *textF;
- (IBAction)backBtnClick:(id)sender;
- (IBAction)changeBtnClick:(id)sender;
-(void)makeChangeColor:(void(^)(NSString *string))Blocks;
@property (nonatomic ,weak)id<BViewControllerDelegate>delegate;
@end

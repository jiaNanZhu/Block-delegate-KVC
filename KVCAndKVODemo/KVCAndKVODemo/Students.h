//
//  Students.h
//  KVCAndKVODemo
//
//  Created by 朱佳男 on 9/22/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"
@interface Students : NSObject
{
    NSString *name;
    NSInteger point;
    Course   *course;
    NSArray  *otherStudent;
}
@end

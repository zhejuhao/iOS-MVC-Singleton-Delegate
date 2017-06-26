//
//  Model.m
//  Test
//
//  Created by li qi on 2017/6/26.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import "Model.h"

@implementation Model
- (void)save{
    NSLog(@"保存...");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSuccessful" object:self];
}

- (void)load{
    NSLog(@"加载。。。");
}
@end

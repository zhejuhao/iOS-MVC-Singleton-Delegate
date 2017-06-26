//
//  View.m
//  Test
//
//  Created by li qi on 2017/6/26.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import "View.h"

@implementation View

- (void)initView{
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setFrame:CGRectMake(100, 300, 60, 40)];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:self.saveButton];
    
    self.loadButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loadButton setFrame:CGRectMake(100, 400, 60, 40)]
    ;
    [self.loadButton setTitle:@"Load" forState:UIControlStateNormal];
    [self.loadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.loadButton];
}

@end

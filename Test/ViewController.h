//
//  ViewController.h
//  Test
//
//  Created by li qi on 2017/6/19.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "Single.h"
#import "TestKVO.h"

@interface ViewController : UIViewController<TestDelegate>


@property(nonatomic, strong)UILabel *testLabel;
@property (nonatomic, strong)TestKVO *testKVO;

@end


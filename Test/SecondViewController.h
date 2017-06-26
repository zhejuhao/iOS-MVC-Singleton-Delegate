//
//  SecondViewController.h
//  Test
//
//  Created by li qi on 2017/6/20.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "View.h"
#import "Model.h"

//@protocol TestDelegate <NSObject>
//
//- (void)showStringWithString:(NSString *)str;
//
//@end
@interface SecondViewController : UIViewController

//@property(nonatomic,assign) id<TestDelegate> delegate;

@property (nonatomic,retain)View *testView;
@property (nonatomic,retain)Model *testModel;

@end

//
//  SecondViewController.m
//  Test
//
//  Created by li qi on 2017/6/20.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveOK:) name:@"saveSuccessful" object:nil];
    
    //MVC
    self.testModel = [[Model alloc]init];
    self.testView = [[View alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    [self.testView initView];
    [self.testView.saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.testView.loadButton addTarget:self action:@selector(loadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.testView];
    
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 40)];
    button.titleLabel.text = @"button";
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];


}

- (void)buttonPressed:(id)sender{
   //通知
   NSNotification *notification =  [NSNotification notificationWithName:@"123" object:nil userInfo:@{@"name":@"hahaha"}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    //block
    NSString *text =@"I'm from block";
    self.callBackBlock(text);
    
    [self sendString:^(NSString *textBlock){
        NSLog(@"%@",textBlock);
    }];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)sendString:(void(^)(NSString *textBlock))block{
    NSString *textBlock = @"This is a block";
    block(textBlock);
}

- (void)saveButtonPressed:(UIButton *)sender{
    [self.testModel save];
}

- (void)loadButtonPressed:(UIButton *)sender{
    [self.testModel load];
}


- (void)saveOK:(NSNotification *)sender{
    NSLog(@"saveOk");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

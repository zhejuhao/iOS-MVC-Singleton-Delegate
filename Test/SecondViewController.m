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
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveOK:) name:@"saveSuccessful" object:nil];
    
    
    
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

- (void)buttonPressed:(id)sender {
    
   NSNotification *notification =  [NSNotification notificationWithName:@"123" object:nil userInfo:@{@"name":@"hahaha"}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(showStringWithString:)]) {
//        [self.delegate showStringWithString:@"hihihi"];
//    }
    
    [self.navigationController popViewControllerAnimated:YES];
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

//
//- (void)showStringWithString:(NSString *)str{
//    NSLog(@"%@",str);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

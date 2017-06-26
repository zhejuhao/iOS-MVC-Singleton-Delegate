//
//  ViewController.m
//  Test
//
//  Created by li qi on 2017/6/19.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifitionAction:) name:@"123" object:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem ];
    [button setFrame:CGRectMake(100, 250, 100, 40)];
    button.titleLabel.text = @"button";
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [Single shareSingle].delegate = nil;
    
    [super viewWillDisappear:animated];
    
}

- (void)notifitionAction:(id)sender{
    NSLog(@"%@",sender);
}



- (void)buttonPressed:(id)sender {
  
    [Single shareSingle].delegate = self;
    [[Single shareSingle] sendString];
    SecondViewController *secondView = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondView animated:YES];
}



- (void)showStringWithString:(NSString *)str{
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

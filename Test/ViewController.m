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
    
    self.testLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 360, 100, 40)];

    self.testLabel.backgroundColor = [UIColor redColor];
    self.testLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.testLabel];
    
    self.testKVO = [[TestKVO alloc] init];
    [self.testKVO addObserver:self forKeyPath:@"num" options: NSKeyValueObservingOptionNew context:nil];
    
    
    UIButton *kvoButton = [UIButton buttonWithType:UIButtonTypeSystem ];
    [kvoButton setFrame:CGRectMake(100, 450, 100, 40)];
    [kvoButton setTitle:@"kvo" forState:UIControlStateNormal];
    [kvoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [kvoButton addTarget:self action:@selector(kvoButtonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:kvoButton];

    
    
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

- (void)kvoButtonPressed:(id)sender{
    self.testKVO.num += 1;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"num"] && object == self.testKVO) {
        self.testLabel.text = [NSString stringWithFormat:@"%@",[change valueForKey:@"new"]];
    }
}




- (void)showStringWithString:(NSString *)str{
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self removeObserver:self forKeyPath:@"num"];
}

@end

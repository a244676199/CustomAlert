//
//  ViewController.m
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import "ViewController.h"
#import "HHInputView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(100, 100, 50, 30);
    b.backgroundColor = [UIColor redColor];
    [self.view addSubview:b];
    [b addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick:(UIButton *)b {
    [[HHInputView inputView] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

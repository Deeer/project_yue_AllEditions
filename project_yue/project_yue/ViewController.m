//
//  ViewController.m
//  project_yue
//
//  Created by Dee on 15/5/22.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *b=[[NSBundle mainBundle]bundleIdentifier];
    NSLog(@"%@",b);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
//
//  enloginViewController.m
//  yueObj
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "enloginViewController.h"
#import "loginViewController.h"

@interface enloginViewController ()

@end

@implementation enloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.name.text=self.namegField;
    self.passward.text=self.pwdFiled;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)back:(id)sender{
    loginViewController *loginpage=[[loginViewController alloc]init];
    [self presentViewController:loginpage animated:YES completion:nil];
}

@end

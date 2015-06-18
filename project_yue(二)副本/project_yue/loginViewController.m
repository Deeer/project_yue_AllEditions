//
//  loginViewController.m
//  yueObj
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "loginViewController.h"
#import "ViewController.h"
#import "enloginViewController.h"
//#import "enrollViewController.h"
@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

-(IBAction)Login:(id)sender{
    if([self.nameField.text isEqualToString:@""] || [self.passField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"用户名或密码为空！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    if(![self.nameField.text isEqualToString:@"abc"] || ![self.passField.text isEqualToString:@"123"])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"用户名或密码错误！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
//    enloginViewController *enlogin=[[enloginViewController alloc]init];
//    enlogin.namegField=self.nameField.text;
//    enlogin.pwdFiled=self.passField.text;
    UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tableBarContrller = [storyBoard instantiateViewControllerWithIdentifier:@"MBar"];
    
//    UITabBarController *tableBarContrller = [storyBoard instantiateInitialViewController];
//    [self.navigationController pushViewController:tableBarContrller animated:YES];

    
//    [self presentViewController:tableBarContrller animated:YES completion:nil];
  [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
      
      [[UIApplication sharedApplication].delegate window].rootViewController =tableBarContrller;
      
      
  } completion:^(BOOL finished) {
      
  }];
    
    
    
}

-(IBAction)back:(id)sender{
//    ViewController *view=[[ViewController alloc]init];
//    [self presentViewController:view animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end

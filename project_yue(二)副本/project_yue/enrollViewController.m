//
//  enrollViewController.m
//  yueObj
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "enrollViewController.h"
#import "ViewController.h"

@interface enrollViewController ()

@end

@implementation enrollViewController

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

-(IBAction)save:(id)sender{
    if([self.ennameField.text isEqualToString:@""] || [self.enmimaField.text isEqualToString:@""] || [self.reenmimaField.text isEqualToString:@""] || [self.addressField.text isEqualToString:@""] || [self.numberField.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"输入的内容不能为空" delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alert show];
        return;
    }
    else
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"注册成功，欢迎登录！" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertview show];
        return;
    }
}

-(IBAction)back:(id)sender{
//    ViewController *view=[[ViewController alloc]init];
//    [self presentViewController:view animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if (![touch.view isKindOfClass: [UITextField class]] || ![touch.view isKindOfClass: [UITextView class]]) {
        
        [self.view endEditing:YES];
     }
}

@end

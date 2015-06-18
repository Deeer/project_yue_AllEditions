//
//  MakeDataVC.m
//  project_yue
//
//  Created by Dee on 15/6/13.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "MakeDataVC.h"
#import "MBProgressHUD+MJ.h"
@interface MakeDataVC ()<UITextFieldDelegate>
{
    MyDataModel *myData;
}

@property (weak, nonatomic) IBOutlet UITextField *timeFiled;

@property (weak, nonatomic) IBOutlet UITextField *addressFiled;

@end

@implementation MakeDataVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.addressFiled.delegate= self;
    [self AddMyDateBtn];

}

-(void)AddMyDateBtn
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    btn.center = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5+110);
    btn.layer.cornerRadius = 60;
    btn.clipsToBounds = YES;
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    
    [btn setTitle:@"约一下" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sendMyData) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)sendMyData
{
    MyDataModel *model = [[MyDataModel alloc]init];
    model.time = self.timeFiled.text;
    model.address = self.addressFiled.text;
   
#pragma todo-----发送数据请求
    if ([self.timeFiled.text  isEqual: @""]) {
        [MBProgressHUD showError:@"请填写时间"];
        return;
    }
    if ([self.addressFiled.text  isEqual:@""]) {
        [MBProgressHUD showError:@"请填写地址"];
        return ;
    }
    
    [MBProgressHUD showSuccess:@"发送成功"];
    

    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

@end

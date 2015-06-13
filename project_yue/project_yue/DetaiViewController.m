//
//  DetaiViewController.m
//  project_yue
//
//  Created by Dee on 15/6/7.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "DetaiViewController.h"

@interface DetaiViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameField;

@property (weak, nonatomic) IBOutlet UILabel *addressField;
- (IBAction)ReplayBtn:(id)sender;
- (IBAction)cancleBtn:(id)sender;
@end

@implementation DetaiViewController



-(NSMutableArray *)MessageArray
{
    if (!_MessageArray) {
        _MessageArray =[NSMutableArray array];
        
    }
    return _MessageArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text=self.MessageArray[0];

    self.addressField.text =self.MessageArray[1];
    
//    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-100, self.view.frame.size.height, 200, 100)];
//    [btn addTarget:self action:@selector(dissmissController) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
   
}





- (IBAction)ReplayBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancleBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

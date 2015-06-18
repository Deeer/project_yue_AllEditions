//
//  enloginViewController.h
//  yueObj
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enloginViewController : UIViewController

@property (nonatomic,retain) IBOutlet UILabel *name;
@property (nonatomic,retain) IBOutlet UILabel *passward;
@property (nonatomic,copy)NSString *namegField;
@property (nonatomic,copy)NSString *pwdFiled;

-(IBAction)back:(id)sender;

@end

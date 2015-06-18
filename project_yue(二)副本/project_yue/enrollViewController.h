//
//  enrollViewController.h
//  yueObj
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enrollViewController : UIViewController

@property (nonatomic,retain) IBOutlet UITextField *ennameField;
@property (nonatomic,retain) IBOutlet UITextField *enmimaField;
@property (nonatomic,retain) IBOutlet UITextField *reenmimaField;
@property (nonatomic,retain) IBOutlet UITextField *addressField;
@property (nonatomic,retain) IBOutlet UITextField *numberField;

-(IBAction)save:(id)sender;
-(IBAction)back:(id)sender;

@end

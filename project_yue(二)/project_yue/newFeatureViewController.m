//
//  newFeatureViewController.m
//  project_yue
//
//  Created by Dee on 15/5/27.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "newFeatureViewController.h"
#import "FirstViewController.h"
#import "MainNavigationController.h"
#import "DeepageView.h"
#define centerw self.view.frame.size.width*.5
@interface newFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIPageControl *pagescroll;
@end

@implementation newFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    CGRect rect =  CGRectMake(100, 100, 100, 100);
    
    NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"1",@"2",@"3",nil];
    DeepageView *pageview=[[DeepageView alloc]initWithFrame:self.view.frame andPicArray:arr];
    [self.view addSubview:pageview];
    
    
}

-(BOOL)prefersStatusBarHidden
{
    return  YES;
}

@end

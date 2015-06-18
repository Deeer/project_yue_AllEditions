//
//  MyDataModel.m
//  project_yue
//
//  Created by Dee on 15/6/16.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "MyDataModel.h"

@interface MyDataModel ()

@end

@implementation MyDataModel
-(MyDataModel *)modelwithData:(NSString *)time AndAddress:(NSString*)address
{
    self.time = time;
    self.address = address;
    
    return self;
}


@end

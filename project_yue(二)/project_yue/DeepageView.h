//
//  DeepageView.h
//  project_yue
//
//  Created by Dee on 15/5/29.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeepageView : UIView

+(instancetype)pageViewWithFrame:(CGRect)frame andPicArray:(NSArray *)picArr;
-(instancetype)initWithFrame:(CGRect)frame andPicArray:(NSArray *)picArr;

@end

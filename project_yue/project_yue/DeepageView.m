//
//  DeepageView.m
//  project_yue
//
//  Created by Dee on 15/5/29.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//



#import "DeepageView.h"
#define centerw self.frame.size.width*.5
#define viewH self.frame.size.height
#define btnHeight viewH-90
#define pageConH centerY-20





@interface DeepageView ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIPageControl *pagescroll;
@end

@implementation DeepageView


/** 用于项目开始时的新特性简介，最后的button需要调整
 *  @param frame  scrollview的frame
 *  @param picArr 传入轮播器的图片名称,png图片不用带.png
 *
 *  @return 返回一个带有scroll的一个view；
 */
+(instancetype)pageViewWithFrame:(CGRect)frame andPicArray:(NSArray *)picArr
{
  return   [[self alloc]initWithFrame:frame andPicArray:picArr];
}

-(instancetype)initWithFrame:(CGRect)frame andPicArray:(NSArray *)picArr
{
    if (self=[super initWithFrame:frame])
    {

    UIScrollView *scroll =[[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:scroll];
    
    CGFloat imageW = scroll.frame.size.width;
    CGFloat imageH = scroll.frame.size.height;
    
    for (int i =0; i<picArr.count; i++) {
        
        UIImageView *imageView =[[UIImageView alloc]init];
        
        NSString *imagename =picArr[i];
        imageView.image =[UIImage imageNamed:imagename];
        CGFloat imageX =i*imageW;
        imageView.frame =CGRectMake(imageX , 0, imageW, imageH);
        
        [scroll addSubview:imageView];
        if (i==picArr.count-1) {
            [self addBtn:imageView];
        }
    }
    scroll.contentSize =CGSizeMake(imageW*picArr.count, 0);
    scroll.showsHorizontalScrollIndicator =NO;
    scroll.pagingEnabled = YES;
    scroll.backgroundColor =[UIColor whiteColor];
    scroll.bounces= NO;
    scroll.delegate= self;

    
    UIPageControl *pageCon =[[UIPageControl alloc]init];
    pageCon.numberOfPages=3;
    CGFloat centerX =centerw;
    CGFloat centerY =viewH;
    pageCon.center =CGPointMake(centerX, pageConH);
    pageCon.bounds =CGRectMake(0, 0, 100, 30);
    pageCon.userInteractionEnabled= NO;
    pageCon.currentPageIndicatorTintColor =[UIColor blackColor];
    pageCon.pageIndicatorTintColor =[UIColor grayColor];
    self.pagescroll= pageCon;
    [self addSubview:pageCon];
    }
    
    return self;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offset = scrollView.contentOffset.x;
    
    double page =offset/scrollView.frame.size.width;
    
    int intpage =(int)(page +0.5);
    
    self.pagescroll.currentPage = intpage;
}

-(void)addBtn:(UIImageView*)imageView
{
    imageView.userInteractionEnabled =YES;
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    
    btn.center =CGPointMake(centerw, btnHeight);
    
    [btn addTarget:self action:@selector(changeCon:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:btn];
    
    
}
//控制器跳转
-(void)changeCon:(UIButton *)btn
{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateInitialViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = viewController;
    
}



@end

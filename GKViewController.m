//
//  GKViewController.m
//  my
//
//  Created by ibokan on 13-1-5.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "GKViewController.h"

@interface GKViewController ()

@end

@implementation GKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  

    UIImage *image3=[UIImage imageNamed:@"bg_choose_grade.png"];
    UIImageView *view3=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 320, 240))];
    view3.image=image3;
    [self.view addSubview:view3];

    UIImage *image2=[UIImage imageNamed:@"angel.png"];
    UIImageView *view2=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 280, 200))];
    view2.image=image2;
    [view3 addSubview:view2];
    
    UIImage *image4=[UIImage imageNamed:@"57.png"];
    UIImageView *view4=[[UIImageView alloc]initWithFrame:(CGRectMake(10, 200, 180, 40))];
    view4.image=image4;
    [view3 addSubview:view4];

    
    [self setBackgroud:@"bottom.png" makeX:0 makeY:420 weigth:320 heigth:40];
    [self setBackgroud:@"star.png" makeX:50 makeY:280 weigth:25 heigth:25];
    [self setBackgroud:@"star2.png" makeX:135 makeY:280 weigth:50 heigth:25];
    [self setBackgroud:@"star3.png" makeX:220 makeY:280 weigth:60 heigth:25];
    [self setBackgroud:@"81.png" makeX:160 makeY:340 weigth:80 heigth:35];
    
    [self setButton];
        
    UIButton *but4=[UIButton buttonWithType:(UIButtonTypeCustom)];
    but4.frame=CGRectMake(240, 336, 70, 35);
    but4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"next.png"]];
    [but4 addTarget:self action:@selector(nextPusth) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:but4];
    
}
//添加背景图片
-(void)setBackgroud:(NSString *)pictrueName makeX:(int)x makeY:(int)y weigth:(float)weigth heigth:(float)heigth
{
    UIImage *image=[UIImage imageNamed:pictrueName];
    UIImageView *view=[[UIImageView alloc]initWithFrame:(CGRectMake(x, y, weigth, heigth))];
    view.image=image;
    [self.view addSubview:view];
}
//创建button
-(void)setButton
{
    grad=4;
    but1=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [but1 setTitle:@"高一" forState:(UIControlStateNormal)];
    but1.tag=2;
    [but1 addTarget:self action:@selector(DoCiek:) forControlEvents:(UIControlEventTouchUpInside)];
    but1.frame=CGRectMake( 30, 245 , 80, 34);
    [self.view addSubview:but1];
    but2=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [but2 setTitle:@"高二" forState:(UIControlStateNormal)];
    but2.tag=1;
    [but2 addTarget:self action:@selector(DoCiek:) forControlEvents:(UIControlEventTouchUpInside)];
    but2.frame=CGRectMake( 120, 245 , 80, 34);
    [self.view addSubview:but2];
    but3=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [but3 setTitle:@"高三" forState:(UIControlStateNormal)];
    but3.tag=0;
    [but3 addTarget:self action:@selector(DoCiek:) forControlEvents:(UIControlEventTouchUpInside)];
    but3.frame=CGRectMake( 210, 245 , 80, 34);
    [self.view addSubview:but3];
 
}
//点击button的事件响应
-(void)DoCiek:(id)sender 
{
//    if (grad!=4) {
//        [self setButton];
//    }
//    
    UIButton *tempBut=(UIButton *)sender;
    switch (tempBut.tag) {
        case 0:
            
            [tempBut setBackgroundImage:[UIImage imageNamed:@"bg_choose_grade.png"] forState:(UIControlStateNormal)];
            grad=1;
            break;
        case 1:
            [tempBut setBackgroundImage:[UIImage imageNamed:@"bg_choose_grade.png"] forState:(UIControlStateNormal)];
            grad=2;
            break;
        case 2:
            [tempBut setBackgroundImage:[UIImage imageNamed:@"bg_choose_grade.png"] forState:(UIControlStateNormal)];
            grad=3;
            break;
            
        default:
            break;
    }
   
    
}
-(void)nextPusth
{
    
    HSTiKuViewController *home=[[HSTiKuViewController alloc]init];
    UINavigationController *naviHome=[[UINavigationController alloc]initWithRootViewController:home];
    home.grade=grad;
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 80, 50))];
    imageView1.image=[UIImage imageNamed:@"smart_normal.png"];
   
    SendViewController *send=[[SendViewController alloc]init];
    UINavigationController *naviSend=[[UINavigationController alloc]initWithRootViewController:send];
    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:(CGRectMake(80, 0, 80, 50))];
    imageView2.image=[UIImage imageNamed:@"dictionary_normal.png"];

    
    LishViewController *lish=[[LishViewController alloc]init];
    lish.gread=grad;
    UINavigationController *naviLish=[[UINavigationController alloc]initWithRootViewController:lish];
    UIImageView *imageView3=[[UIImageView alloc]initWithFrame:(CGRectMake(160, 0, 80, 50))];
    imageView3.image=[UIImage imageNamed:@"listening_normal.png"];
    
    MoveViewController *move=[[MoveViewController alloc]init];
    UINavigationController *naviMove=[[UINavigationController alloc]initWithRootViewController:move];
    UIImageView *imageView4=[[UIImageView alloc]initWithFrame:(CGRectMake(240, 0, 80, 50))];
    imageView4.image=[UIImage imageNamed:@"more_normal.png"];

    UITabBarController *tab=[[UITabBarController alloc]init];
    tab.tabBar.tintColor=[UIColor clearColor];
    [tab.tabBar insertSubview:imageView1 aboveSubview:naviHome.view];
    [tab.tabBar insertSubview:imageView2 aboveSubview:naviSend.view];
    [tab.tabBar insertSubview:imageView3 aboveSubview:naviLish.view];
    [tab.tabBar insertSubview:imageView4 aboveSubview:naviMove.view];

    UIImage *tabImage=[[UIImage imageNamed:@"titlebar.png"]resizableImageWithCapInsets:(UIEdgeInsetsMake(0,420, 320,60 ))];
    if ([[tab tabBar] respondsToSelector:@selector(setBackgroundImage:)]) {
        [[tab tabBar] setBackgroundImage:tabImage];
    }
    tab.viewControllers=[NSArray arrayWithObjects:naviHome,naviSend,naviLish,naviMove, nil];
    
    [self presentModalViewController:tab animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  HSTiKuViewController.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import "HSTiKuViewController.h"

@interface HSTiKuViewController ()
@end

@implementation HSTiKuViewController
@synthesize grade,tabBar,myNav,year;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.tabBar =[[UITabBarController alloc]init];
       
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:@"title_smart.png"];
        [imageView setImage:image];
        self.navigationItem.titleView = imageView;

    }
    return self;
}
-(void)loadUI
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -150, 320, 700)];
    UIImage *img = [UIImage imageNamed:@"background.png"];
    imgView.image = img;
    
    UIScrollView *sview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    sview.delegate = self;
    sview.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //[sview setContentOffset:CGPointMake(0, 300) animated:YES];
    sview.showsHorizontalScrollIndicator = NO;
    sview.showsVerticalScrollIndicator = NO;
    sview.contentSize = CGSizeMake(320, 500);
    //sview.pagingEnabled = YES;
    [sview addSubview:imgView];  
    [self.view addSubview:sview];
    
    //题库首页横向滚动条
    UIImage *scroolL = [UIImage imageNamed:@"screenscroll.jpg"];
    UIImageView *scroolHL = [[UIImageView alloc]initWithImage:scroolL];
    scroolHL.frame = CGRectMake(0, 0, 320, 30);
    [self.view addSubview:scroolHL];
    
    UIScrollView *myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 0, 275, 30)];
    myScrollView.contentSize = CGSizeMake(800, 30);
    myScrollView.pagingEnabled = YES;
    //myScrollView.backgroundColor = [UIColor blueColor];
    myScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.showsVerticalScrollIndicator = NO;
    myScrollView.pagingEnabled = NO;
    
    myScrollView.delegate = self;
    NSArray *scrollYear = [[NSArray alloc]initWithObjects:@"不限",@"2012",@"2011",@"2010",@"2009",@"2008",@"2007",@"2006",@"2005",@"2004",@"2003",@"2002",@"2001",@"2000", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:scrollYear];
    segment.frame = CGRectMake(0, 0, 800, 30);
    
    [myScrollView addSubview:segment];
    [self.view addSubview:myScrollView];
    
    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];

    //**********************************************
    UIImage *number1= [UIImage imageNamed:@"dxt.png"];
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(30, 40, 50, 50);
    button1.backgroundColor = [UIColor colorWithPatternImage:number1];
    [sview addSubview:button1];
    [button1 addTarget:self action:@selector(buttonPush:) forControlEvents:(UIControlEventTouchUpInside)];
    UILabel *number1Label = [[UILabel alloc]initWithFrame:CGRectMake(30, 90, 80, 30)];
    number1Label.text = @"单选题";
    number1Label.backgroundColor = [UIColor clearColor];
    button1.tag = 1;
    [sview addSubview:number1Label];
    
    
    UIImage *number2= [UIImage imageNamed:@"yyzs.png"];
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(130, 40, 50, 50);
    button2.backgroundColor = [UIColor colorWithPatternImage:number2];
    [sview addSubview:button2];
    [button2 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number2Label = [[UILabel alloc]initWithFrame:CGRectMake(130, 90, 80, 30)];
    number2Label.text = @"语音知识";
    number2Label.backgroundColor = [UIColor clearColor];
    button2.tag = 2;
    [sview addSubview:number2Label];
    
    
    UIImage *number3= [UIImage imageNamed:@"wxtk.png"];
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(230, 40, 50, 50);
    button3.backgroundColor = [UIColor colorWithPatternImage:number3];
    [sview addSubview:button3];
    [button3 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number3Label = [[UILabel alloc]initWithFrame:CGRectMake(230, 90, 80, 30)];
    number3Label.text = @"完形填空";
    number3Label.backgroundColor = [UIColor clearColor];
    button3.tag = 3;
    [sview addSubview:number3Label];
    
    
    UIImage *number4= [UIImage imageNamed:@"ydlj.png"];
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(30, 120, 50, 50);
    button4.backgroundColor = [UIColor colorWithPatternImage:number4];
    [sview addSubview:button4];
    [button4 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number4Label = [[UILabel alloc]initWithFrame:CGRectMake(30, 170, 80, 30)];
    number4Label.text = @"阅读理解";
    number4Label.backgroundColor = [UIColor clearColor];
    button4.tag = 4;
    [sview addSubview:number4Label];
    
    
    UIImage *number5= [UIImage imageNamed:@"bqyd.png"];
    UIButton * button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(130, 120, 50, 50);
    button5.backgroundColor = [UIColor colorWithPatternImage:number5];
    [sview addSubview:button5];
    [button5 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number5Label = [[UILabel alloc]initWithFrame:CGRectMake(130, 170, 80, 30)];
    number5Label.text = @"补全阅读";
    number5Label.backgroundColor = [UIColor clearColor];
    button5.tag = 5;
    [sview addSubview:number5Label];
    
    
    UIImage *number6= [UIImage imageNamed:@"dwgc.png"];
    UIButton * button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(230, 120, 50, 50);
    button6.backgroundColor = [UIColor colorWithPatternImage:number6];
    [sview addSubview:button6];
    [button6 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number6Label = [[UILabel alloc]initWithFrame:CGRectMake(230, 170, 80, 30)];
    number6Label.text = @"短文改错";
    number6Label.backgroundColor = [UIColor clearColor];
    button6.tag = 6;
    [sview addSubview:number6Label];
    
    
    UIImage *number7= [UIImage imageNamed:@"smbd.png"];
    UIButton * button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(30, 200, 50, 50);
    button7.backgroundColor = [UIColor colorWithPatternImage:number7];
    [sview addSubview:button7];
    [button7 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number7Label = [[UILabel alloc]initWithFrame:CGRectMake(30, 250, 80, 30)];
    number7Label.text = @"书面表达";
    number7Label.backgroundColor = [UIColor clearColor];
    button7.tag = 7;
    [sview addSubview:number7Label];
    
    
    UIImage *number8= [UIImage imageNamed:@"dcpx.png"];
    UIButton * button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(130, 200, 50, 50);
    button8.backgroundColor = [UIColor colorWithPatternImage:number8];
    [sview addSubview:button8];
    [button8 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];    UILabel *number8Label = [[UILabel alloc]initWithFrame:CGRectMake(130, 250, 80, 30)];
    number8Label.text = @"单词拼写";
    number8Label.backgroundColor = [UIColor clearColor];
    button8.tag = 8;
    [sview addSubview:number8Label];
    
    
    UIImage *number9= [UIImage imageNamed:@"ydtk.png"];
    UIButton * button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    button9.frame = CGRectMake(230, 200, 50, 50);
    button9.backgroundColor = [UIColor colorWithPatternImage:number9];
    [sview addSubview:button9];
    [button9 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number9Label = [[UILabel alloc]initWithFrame:CGRectMake(230, 250, 80, 30)];
    number9Label.text = @"阅读表达";
    number9Label.backgroundColor = [UIColor clearColor];
    button9.tag = 9;
    [sview addSubview:number9Label];
    
    
    UIImage *number10= [UIImage imageNamed:@"qjdh.png"];
    UIButton * button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    button10.frame = CGRectMake(30, 280, 50, 50);
    button10.backgroundColor = [UIColor colorWithPatternImage:number10];
    [sview addSubview:button10];
    [button10 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number10Label = [[UILabel alloc]initWithFrame:CGRectMake(30, 330, 80, 30)];
    number10Label.text = @"情景对话";
    number10Label.backgroundColor = [UIColor clearColor];
    button10.tag = 10;
    [sview addSubview:number10Label];
    
    
    UIImage *number11= [UIImage imageNamed:@"fy.png"];
    UIButton * button11 = [UIButton buttonWithType:UIButtonTypeCustom];
    button11.frame = CGRectMake(130, 280, 50, 50);
    button11.backgroundColor = [UIColor colorWithPatternImage:number11];
    [sview addSubview:button11];
    [button11 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number11Label = [[UILabel alloc]initWithFrame:CGRectMake(130, 330, 80, 30)];
    number11Label.text = @"翻译";
    number11Label.backgroundColor = [UIColor clearColor];
    button11.tag = 11;
    [sview addSubview:number11Label];
    
    
    UIImage *number12= [UIImage imageNamed:@"jxzh.png"];
    UIButton * button12 = [UIButton buttonWithType:UIButtonTypeCustom];
    button12.frame = CGRectMake(230, 280, 50, 50);
    button12.backgroundColor = [UIColor colorWithPatternImage:number12];
    [sview addSubview:button12];
    [button12 addTarget:self action:@selector(buttonPush:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *number12Label = [[UILabel alloc]initWithFrame:CGRectMake(230, 330, 80, 30)];
    number12Label.text = @"语法填空";
    number12Label.backgroundColor = [UIColor clearColor];
    button12.tag = 12;
    [sview addSubview:number12Label];
    //*********************************************
}
-(void)buttonPush:(UIButton *)sender
{
    HSTikuDetailViewController * tikuViewContro = [[HSTikuDetailViewController alloc]init];
    tikuViewContro.year =self.year;
    tikuViewContro.tag = sender.tag;
    [self.navigationController pushViewController:tikuViewContro animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
}
-(void)segmentChanged:(UISegmentedControl *)sender
{
    NSString * yearStr = [sender titleForSegmentAtIndex:[sender selectedSegmentIndex]];
    NSLog(@"***HS*** segmentIsPressed***** year = %@",yearStr);
    
    if([yearStr isEqualToString:@"不限"])
    {
        self.year = 0;
    }
    else
    {
        self.year = yearStr ;  
    }
      
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

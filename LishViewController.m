//
//  LishViewController.m
//  my
//
//  Created by ibokan on 13-1-6.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

/*
 http://api.winclass.net/serviceaction.do?method=themelibrary&subjectid=3&pagesize=20&areaid=0&gread=0&titletype=28&year=
 单选题1，语音知识13，完形填空14，阅读理解15，补全阅读16，短文改错17，书面表达18，单词拼写19，阅读表达20，情景对话21，翻译24，句型转换28
 .英语听力
 简短对话610，推断判断669，现代技术651，人物关系671，对话背景670，补全填空675，旅游交通684，精彩故事683，文化教育680，历史地理650，健康饮食653，职场工作674，自然环境681，天气气候672，购物消费673，节日庆典645，文化娱乐647，其他641
 */
#import "LishViewController.h"

@interface LishViewController ()

@end

@implementation LishViewController
@synthesize url;
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
    self.navigationItem.title=@"英语听力";
    
	[self setBack];
//    [self setBackgrourd];
//    [self setButton];
    [self setScrollView];
}
-(void)setScrollView
{
    UIImage *image=[UIImage imageNamed:@"background.png"];
    UIImageView *view=[[UIImageView alloc]initWithFrame:(CGRectMake(0,0, 320, 480))];
    view.image=image;
    
    sview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    sview.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    sview.pagingEnabled=NO;
//    [sview setContentOffset:(CGPointMake(0, 300)) animated:YES];
    sview.contentSize=CGSizeMake(320, 600);
    [self.view addSubview:view];
    [self.view addSubview:sview];
//    [self setBackgrourd];
    [self setButton:@"jddh.png" makeX:26 makeY:19 name:@"简短对话" tag:610];
    [self setButton:@"rwgx.png" makeX:26 makeY:99 name:@"人物关系" tag:671];
    [self setButton:@"lyjt.png" makeX:26 makeY:179 name:@"旅游交通" tag:684];
    [self setButton:@"lsdl.png" makeX:26 makeY:259 name:@"历史地理" tag:650];
    [self setButton:@"zrhj.png" makeX:26 makeY:339 name:@"自然环境" tag:681];
    [self setButton:@"smbd.png" makeX:26 makeY:419 name:@"节日庆典" tag:645];
    
    [self setButton:@"tlpd.png" makeX:132 makeY:19 name:@"推理判断" tag:669];
    [self setButton:@"qjdh.png" makeX:132 makeY:99 name:@"对话背景" tag:670];
    [self setButton:@"jcgs.png" makeX:132 makeY:179 name:@"精彩故事" tag:683];
    [self setButton:@"jkys.png" makeX:132 makeY:259 name:@"健康饮食" tag:653];
    [self setButton:@"tqqh.png" makeX:132 makeY:339 name:@"天气气候" tag:672];
    [self setButton:@"jrqd.png" makeX:132 makeY:419 name:@"文化娱乐" tag:647];    
    [self setButton:@"xdjs.png" makeX:239 makeY:19 name:@"现代技术" tag:651];
    [self setButton:@"wxtk.png" makeX:239 makeY:99 name:@"补全对话" tag:675];
    [self setButton:@"whyl.png" makeX:239 makeY:179 name:@"文化教育" tag:680];
    [self setButton:@"zcgz.png" makeX:239 makeY:259 name:@"职场工作" tag:674];
    [self setButton:@"gwxf.png" makeX:239 makeY:339 name:@"购物消费" tag:673];
    [self setButton:@"qt.png" makeX:239 makeY:419 name:@"  其他  " tag:641];
}

-(void)setButton:(NSString *)picture makeX:(int)i makeY:(int)j name:(NSString *)name tag:(int)tag
{
    UIButton *but=[UIButton buttonWithType:(UIButtonTypeCustom)];
    but.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:picture]];
    but.tag=tag;
    
    [but addTarget:self action:@selector(setPush:) forControlEvents:(UIControlEventTouchUpInside)];
    but.frame=CGRectMake(i, j, 50, 47);
    UILabel *label=[[UILabel alloc]initWithFrame:(CGRectMake(i-3, j+47, 70, 30))];
    label.text=name;
    label.font=[UIFont boldSystemFontOfSize:14];
    label.backgroundColor=[UIColor clearColor];
    [sview addSubview:label];
    [sview addSubview:but];
//    UIButton *but1=[UIButton buttonWithType:(UIButtonTypeCustom)];
//    but1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"jddh.png"]];
//    [but1 addTarget:self action:@selector(setPush) forControlEvents:(UIControlEventTouchUpInside)];
//    but1.frame=CGRectMake(26, 93, 50, 42);
//    [self.view addSubview:but1];//@"jddh.png"
}
//跳转页面
//http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=669
-(void)setPush:(id)sender
{
    UIButton *but=(UIButton *)sender;
//    NSString *url;
    url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",but.tag];
//    switch (but.tag) {
//        case 0:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",610];
//        break;
//        case 1:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",671];
//            break;
//        case 2:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",684];
//            break;
//        case 3:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",650];
//            break;
//        case 4:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",681];
//            break;
//        case 5:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",645];
//            break;
//        case 6:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",669];
//            break;
//        case 7:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",670];
//            break;
//        case 8:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",683];
//            break;
//        case 9:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",653];
//            break;
//        case 10:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",672];
//            break;
//        case 11:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",647];
//            break;
//        case 12:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",651];
//            break;
//        case 13:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",675];
//            break;
//        case 14:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",680];
//            break;
//        case 15:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",674];
//            break;
//        case 16:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",673];
//            break;
//        case 17:
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",641];
//            break;
//            url=[NSString stringWithFormat: @"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&currentpagenum=1&pagesize=20&listentype=%d",671];
//        default:
//            break;
//    }
    
    ListhViewController *listh=[[ListhViewController alloc]init];
    listh.sUrl=self.url;
    [self.navigationController pushViewController:listh animated:YES];
}
//添加背景
-(void)setBackgrourd
{
    UIImage *image=[UIImage imageNamed:@"002.png"];
    UIImageView *view=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 320, 400))];
    view.image=image;
    [self.view addSubview:view];
    //bg_dropdownlist.png
}
//自定义导航返回按钮
-(void)setBack
{
//    NSLog(@"&&&&****");
    UIView *view=[[UIView alloc]initWithFrame:(CGRectMake(0, 0, 46, 44))];
    UIButton *but=[UIButton buttonWithType:(UIButtonTypeCustom)];
    but.frame=CGRectMake(5, 5, 52, 30);
    but.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"return_normal.png"]];
//    [but setTitle:@"返回" forState:(UIControlStateNormal)];
    [but addTarget:self action:@selector(doBack) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:but];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:view];
}
-(void)doBack
{
    [self presentModalViewController:[[GKViewController alloc]init] animated:YES];
    
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

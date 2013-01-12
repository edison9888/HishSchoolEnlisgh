//
//  DetaiViewController.m
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "DetaiViewController.h"
#import "AudioStreamer.h"
#import <QuartzCore/CoreAnimation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CFNetwork/CFNetwork.h>

@interface DetaiViewController ()

@end

@implementation DetaiViewController

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
    
    [self initLaodView];
}
-(void)initLaodView
{
    answerX=0;
	UIImage *image=[UIImage imageNamed:@"background.png"];
    view=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 320, 400))];
    view.image=image;
    [self.view addSubview:view];
    pView=[[UIProgressView alloc]initWithProgressViewStyle:(UIProgressViewStyleDefault)];
    pView.progressTintColor=[UIColor blackColor];
    pView.trackTintColor=[UIColor grayColor];
    pView.frame=CGRectMake(50, 345, 240, 20);
    pView.progress=0;
    [self.view addSubview:pView];
    if (self.listh.optionA==nil) {
        [self buQuanDuiHua];
    }
    else{
        
        [self setBackGourd];//调用标题和选项
    }
    [self presentKey];//调用提交按钮
    [self setAVmp3];//调用播放按钮    
    [self setBack];//调用导航
    [self nextKey];
}
-(void)buQuanDuiHua
{
    UITextView *tempText=[[UITextView alloc]initWithFrame:(CGRectMake(20, 10, 290, 300))];
    tempText.backgroundColor=[UIColor clearColor];
    tempText.text=self.listh.title;
    tempText.editable=NO;
    tempText.font=[UIFont boldSystemFontOfSize:18];
    [self.view addSubview:tempText];
}
//下一题
-(void)nextKey
{
    UIButton *tempNxet=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    tempNxet.frame=CGRectMake(0, 370, 320, 50);
    [tempNxet setImage:[UIImage imageNamed:@"banner2.png"] forState:(UIControlStateNormal)];
    UILabel *tempLable=[[UILabel alloc]initWithFrame:(CGRectMake(120, 0, 200, 40))];
    tempLable.text=@"下一题";
    tempLable.backgroundColor=[UIColor clearColor];
    tempLable.font=[UIFont boldSystemFontOfSize:20];
    [tempNxet addSubview:tempLable];
    [tempNxet addTarget:self action:@selector(doNext) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:tempNxet];
}
//重新加载视图
-(void)doNext
{
    [self destroyStreamer];
    int index1;
    index1=[self.copyArray indexOfObject:self.listh];
    if (index1==[self.copyArray count]-1) {
        index1=0;
        self.listh=[self.copyArray objectAtIndex: index1];
        [self initLaodView];
    }
    else{
        index1++;
        self.listh=[self.copyArray objectAtIndex: index1];
        [self initLaodView];

    }
    
}
//返回导航 按钮
-(void)setBack
{
    //    NSLog(@"&&&&****");
    UIView *viewBack=[[UIView alloc]initWithFrame:(CGRectMake(0, 0, 46, 44))];
    UIButton *butBack=[UIButton buttonWithType:(UIButtonTypeCustom)];
    butBack.frame=CGRectMake(5, 5, 52, 30);
    butBack.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"return_normal.png"]];
    //    [but setTitle:@"返回" forState:(UIControlStateNormal)];
    [butBack addTarget:self action:@selector(doBack) forControlEvents:(UIControlEventTouchUpInside)];
    [viewBack addSubview:butBack];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:viewBack];
}
-(void)doBack
{
    [self destroyStreamer];
    [self.navigationController popViewControllerAnimated:YES];
}


//创建播放按钮
-(void)setAVmp3
{
//    NSString *path=@"http://202.204.208.83/gangqin/download/music/02/03/02/Track08.mp3";
//    NSURL *url1=[[NSURL alloc]initFileURLWithPath:path];
//    NSURL *url1=self.listh.midFile;
    
    
    but=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    but.frame=CGRectMake(10, 330, 40, 40);
    [self setBackImage:@"btn_play_normal.png"];//调用播放背景
    [but addTarget:self action:@selector(doPlay) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:but];

}
//播放按钮播放
-(void)doPlay
{
    if ([sImage isEqualToString:@"btn_play_normal.png"]) {
        [self createStreamer];
        [self setBackImage:@"btn_pause_normal.png"];
        [streamer start];
    }
    else
    {
        [self setBackImage:@"btn_play_normal.png"];
        [streamer stop];
        
    }
    
}
//播放按钮的背景图片
-(void)setBackImage:(NSString *)name
{
    if (!name) {
        name=@"btn_play_normal.png";
    }
    sImage=[name retain];
    UIImage *image=[UIImage imageNamed:name];
    [but.layer removeAllAnimations];
    [but setBackgroundImage:image forState:(UIControlStateNormal)];
}
//加载进度条的方法
-(void)showPronress
{
    if (streamer.isPlaying) {
        
        pView.progress=streamer.progress/(streamer.duration);
    }
}
//播放器的准备和链接
-(void)createStreamer
{
    if (streamer) {
        return;
    }
    NSString *esccapedValue=[(NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)self.listh.midFile, NULL, NULL, kCFStringEncodingUTF8)autorelease];
    NSURL *url=[NSURL URLWithString:esccapedValue];
    streamer=[[AudioStreamer alloc]initWithURL:url];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showPronress) userInfo:nil repeats:YES];
}
//加载标题和选项
-(void)setBackGourd
{
    UITextView *lable1=[[UITextView alloc]initWithFrame:(CGRectMake(10, 0, 310, 70))];
    lable1.backgroundColor=[UIColor clearColor];
    lable1.font=[UIFont boldSystemFontOfSize:18];
    lable1.editable=NO;
    lable1.text=self.listh.title;
    [self.view addSubview:lable1];
    optionA=[self setAnswerGourd:@"   A. " makeY:75 name:self.listh.optionA tag:1];
    optionB=[self setAnswerGourd:@"   B. " makeY:115 name:self.listh.optionB tag:2];
    optionC=[self setAnswerGourd:@"   C. " makeY:155 name:self.listh.optionC tag:3];
    if (self.listh.optionD!=nil) {
    optionD=[self setAnswerGourd:@"   D. " makeY:195 name:self.listh.optionD tag:4];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dosetImage) name:@"image" object:optionBut];
}
//选项按钮的定义
-(UIButton *)setAnswerGourd:(NSString *)option makeY:(int)Y name:(NSString *)name tag:(int)tag
{
    NSString *temp=[option stringByAppendingString:name];
    optionBut=[UIButton buttonWithType:(UIButtonTypeCustom)];
    optionBut.frame=CGRectMake(0, Y, 320, 40);
    [optionBut setImageEdgeInsets:(UIEdgeInsetsMake(0, -15, 20, 270))];
    [optionBut setImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:(UIControlStateNormal)];

    optionBut.tag=tag;
    [optionBut addTarget:self action:@selector(doAnswer:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:optionBut];
    UILabel *lable2=[[UILabel alloc]initWithFrame:(CGRectMake(30,-10, 300, 40))];
    lable2.backgroundColor=[UIColor clearColor];
    lable2.lineBreakMode=UILineBreakModeClip;
    lable2.baselineAdjustment=UIBaselineAdjustmentAlignCenters;
    lable2.textAlignment=UITextAlignmentLeft;
    lable2.numberOfLines=0;
    lable2.text=temp;
    [optionBut addSubview:lable2];
    return optionBut;
}


//通知改变背景
-(void)dosetImage
{
    [optionA setImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:(UIControlStateNormal)];
    [optionB setImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:(UIControlStateNormal)];
    [optionC setImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:(UIControlStateNormal)];
    [optionD setImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:(UIControlStateNormal)];
    
}
//选项的响应
-(void)doAnswer:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"image" object:optionBut];
    answerX=sender.tag;
    [sender setImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:(UIControlStateNormal)];
}
//加载提交答案按钮
-(void)presentKey
{
    button=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [button setImage:[UIImage imageNamed:@"btn_submit_normal.png"] forState:(UIControlStateNormal)];
    button.frame=CGRectMake(230, 330, 80, 40);
    [button addTarget:self action:@selector(presentKeyAnswer) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}
//停止
-(void)tingLiStop
{
    [streamer stop];
    pView.progress=0;
}
//销毁播放
- (void)destroyStreamer
{
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:streamer];
		[progressUpdateTimer invalidate];
		progressUpdateTimer = nil;
		
		[streamer stop];
		[streamer release];
		streamer = nil;
	}
}
//提交答案
-(void)presentKeyAnswer
{
    [self tingLiStop];
    if (self.listh.optionA==nil) {
        [but setHidden:YES];
        [button setHidden:YES];
        [pView setHidden:YES];
        answerView=[[UIView alloc]initWithFrame:(CGRectMake(0, 200, 320, 210))];
        [self.view addSubview:answerView];
        NSString *answerStr=[NSString stringWithFormat:@"正确答案是\n%@\n原文是\n",self.listh.answer];
        answerScrollView=[[UITextView alloc]initWithFrame:(CGRectMake(0, 0, 320, 180))];
        answerScrollView.font=[UIFont boldSystemFontOfSize:16];
        answerScrollView.editable=NO;
        answerScrollView.text=[answerStr stringByAppendingString:self.listh.original];
        [answerView addSubview:answerScrollView];
        [self rightBack];
    }
    else{
    if (answerX==1) {
        [self answerViewAndScrollView];//加载视图
        if ([self.listh.answer isEqualToString:@"A"]) {
            [self answerIsAnswer];//判断正确
        }
        else{
            [self answerNotIsAnawer:@"A"];
        }
    }
    else if (answerX==2)
    {
        [self answerViewAndScrollView];//加载视图
        if ([self.listh.answer isEqualToString:@"B"]) {
            [self answerIsAnswer];
        }
        else{
            [self answerNotIsAnawer:@"B"];
        }
    }
    else if (answerX==3)
    {
        [self answerViewAndScrollView];//加载视图
        if ([self.listh.answer isEqualToString:@"C"]) {
            [self answerIsAnswer];
        }
        else{
            [self answerNotIsAnawer:@"C"];
        }
    }
    else if (answerX==4)
    {
        [self answerViewAndScrollView];//加载视图
        if ([self.listh.answer isEqualToString:@"D"]) {           
            [self answerIsAnswer];
        }
        else{
            [self answerNotIsAnawer:@"D"];
        }
    }
    else{
        UIAlertView *tempAler=[[UIAlertView alloc]initWithTitle:@"消息" message:@"无法提交，请选择你的选项！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [tempAler show];
    }
    }
}
//回答的错误调用方法
-(void)answerNotIsAnawer:(NSString *)x
{
    NSString *str=[NSString stringWithFormat:@"你选择了%@，回答错误!",x];
    UILabel *tempLable=[[UILabel alloc]initWithFrame:(CGRectMake(120, 0, 200, 20))];
    tempLable.text=str;
    [answerView addSubview:tempLable];
}
//回答的正确调用方法
-(void)answerIsAnswer
{
    UILabel *tempLable=[[UILabel alloc]initWithFrame:(CGRectMake(120, 0, 200, 20))];
    tempLable.text=@"恭喜你!回答正确";
    [answerView addSubview:tempLable];

}
//显示原文件
-(void)midfileShow
{
    UILabel *tempAnswer=[[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 120, 20))];
    NSString *tempStr=[NSString stringWithFormat:@"正确答案是%@, ",self.listh.answer];
    tempAnswer.text=tempStr;
    [answerView addSubview:tempAnswer];
    answerScrollView=[[UITextView alloc]initWithFrame:(CGRectMake(0, 20, 320, 150))];
    answerScrollView.font=[UIFont boldSystemFontOfSize:16];
    answerScrollView.backgroundColor=[UIColor clearColor];
    answerScrollView.editable=NO;
    answerScrollView.text=self.listh.original;
    [answerView addSubview:answerScrollView];
}
//加载答案的视图
-(void)answerViewAndScrollView
{
    [but setHidden:YES];
    [button setHidden:YES];
    [pView setHidden:YES];
    answerView=[[UIView alloc]initWithFrame:(CGRectMake(0, 200, 320, 210))];
    [self.view addSubview:answerView];
    [self midfileShow];
    [self rightBack];
}
//刷新答案视图
-(void)rightBack
{
    UIView *viewBack=[[UIView alloc]initWithFrame:(CGRectMake(0, 0, 46, 49))];
    UIButton *butBack=[UIButton buttonWithType:(UIButtonTypeCustom)];
    butBack.frame=CGRectMake(0, -5, 52, 45);
    butBack.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_sync.png"]];
    [butBack addTarget:self action:@selector(doRightBack) forControlEvents:(UIControlEventTouchUpInside)];
    [viewBack addSubview:butBack];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:viewBack];
}
-(void)doRightBack
{
    [answerView setHidden:YES];
    [but setHidden:NO];
    [button setHidden:NO];
    [pView setHidden:NO];
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

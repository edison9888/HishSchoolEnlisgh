//
//  MoveViewController.m
//  my
//
//  Created by ibokan on 13-1-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MoveViewController.h"

@interface MoveViewController ()

@end

@implementation MoveViewController

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
	[self setBGScrollView];
}
//背景界面
-(void)setBGScrollView
{
    self.navigationItem.title=@"更多";
    bgScrollView=[[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, 320, 800))];
    bgScrollView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    bgScrollView.pagingEnabled=NO;
    bgScrollView.contentSize=CGSizeMake(320, 820);
    [self.view addSubview:bgScrollView];
    [self setFourButton:@"icon_wrong.png" makeY:0 butTitle:@"错题本" ];
    [self setFourButton:@"icon_word.png" makeY:60 butTitle:@"生词本" ];
    [self setFourButton:@"icon_favorite.png" makeY:120 butTitle:@"收藏夹"];
    [self setFourButton:@"icon_member.png" makeY:180 butTitle:@"会员管理"];
    [self setFourButton:@"icon_sync.png" makeY:240 butTitle:@"分享"];
    [self setFourButton:@"icon_exit.png" makeY:300 butTitle:@"退出程序"];
}
//添加按钮方法
-(void)setFourButton:(NSString *)butPicture makeY:(int)Y butTitle:(NSString *)butTitle
{
    UIButton *fourbutton=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    fourbutton.frame=CGRectMake(-20, Y, 360, 60);
    fourbutton.tag=Y;
    UIImage *butImage=[UIImage imageNamed:butPicture];
    UIImageView *butView=[[UIImageView alloc]initWithFrame:(CGRectMake(20, 0, 60, 60))];
    butView.image=butImage;
    [fourbutton addSubview:butView];
    UILabel *butLabel=[[UILabel alloc]initWithFrame:(CGRectMake(90, 0, 100, 60))];
    butLabel.backgroundColor=[UIColor clearColor];
    butLabel.text=butTitle;
    [fourbutton addTarget:self action:@selector(doDetailMove:) forControlEvents:(UIControlEventTouchUpInside)];
    [fourbutton addSubview:butLabel];
    [bgScrollView addSubview:fourbutton];
}
-(void)doDetailMove:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            TheWrongTopicViewController *topic=[[TheWrongTopicViewController alloc]init];
            topic.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:topic animated:YES];
        }
            break;
        case 60:
                    
            break;
        case 120:
            
            break;
        case 180:
        {
            MemberDetailViewController *member=[[MemberDetailViewController alloc]init];
            member.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:member animated:YES];
        }
            break;
        case 240:
            
            break;
        case 300:
            
            break;
            
        default:
            break;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

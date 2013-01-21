//
//  HSDanxuanViewController.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-8.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSTiku.h"
#import "HSXML.h"
#import "HSTikuDetailViewController.h"
@interface HSDanxuanViewController : UIViewController
{
    HSTiku  * hsTiku;
    NSArray * hsArray;
    
    int mark;//提示按钮切换开关
    
    UILabel * titleLabel;
    UILabel * tishiLabel;
    
    
    UIButton * tishiBtn;
    
    UIButton * list1btn;
    UIButton * list2btn;
    UIButton * list3btn;
    UIButton * list4btn;
    
    UILabel * list1Label;
    UILabel * list2Label;
    UILabel * list3Label;
    UILabel * list4Label;
    
    UIScrollView *sview;//滚动背景
    
    UILabel * resultLabel;
    UIButton * resultBtn;//提交答案按钮
    NSString *result;//用户选择的结果
    
    int time;//答题次数
    
    NSMutableArray * array;//题目数组
    int titleNum;//当前题数
    int row;
    UIButton *nextTitleBtn;//下一题按钮图片
    
    
}
@property int row;

@property (nonatomic,strong)UIButton *nextTitleBtn;
@property (nonatomic,strong)NSMutableArray * array;
@property int titleNum;
@property int time;

@property (nonatomic,strong)NSString *result;

@property (nonatomic,strong)UIButton * resultBtn;
@property (nonatomic,strong)UIScrollView *sview ;
@property (nonatomic,strong)UILabel * list1Label;
@property (nonatomic,strong)UILabel * list2Label;
@property (nonatomic,strong)UILabel * list3Label;
@property (nonatomic,strong)UILabel * list4Label;

@property (nonatomic,strong)UIButton * list1btn;
@property (nonatomic,strong)UIButton * list2btn;
@property (nonatomic,strong)UIButton * list3btn;
@property (nonatomic,strong)UIButton * list4btn;

@property (nonatomic,strong) HSTiku  * hsTiku;
@property (nonatomic,strong) NSArray * hsArray;
@property  int mark;

@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * tishiLabel;
@property (nonatomic,strong)UILabel * resultLabel;
@property (nonatomic,strong)UIButton * tishiBtn;

- (void)viewDidLoad;
@end

//
//  HSWanxingViewController.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-8.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import "HSWanxingViewController.h"

@interface HSWanxingViewController ()

@end

@implementation HSWanxingViewController
@synthesize hsTiku,hsArray,mark,resultLabel,tishiBtn,tishiLabel,titleLabel;
@synthesize list1btn,list2btn,list3btn,list4btn;
@synthesize list1Label,list2Label,list3Label,list4Label;
@synthesize sview,resultBtn,result,time;
@synthesize array,titleNum;
@synthesize nextTitleBtn;
@synthesize row;
@synthesize titleName;
@synthesize imgView;
@synthesize tanchuBtn;
@synthesize xuanxiangSwitch,imageView,answerList;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"完形填空";
        xuanxiangSwitch = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self titleContentCreen];
    [self answerContentCreen];
}

//答案内容
-(void)answerContentCreen
{
    //下一题按钮
    self.nextTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextTitleBtn setBackgroundImage:[UIImage imageNamed:@"titlebar.png"] forState:UIControlStateNormal];
    [nextTitleBtn setFrame:CGRectMake(0, 430, 320, 50)];
    [nextTitleBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [nextTitleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextTitleBtn addTarget:self action:@selector(nextPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarController.view addSubview:nextTitleBtn];
    
    //显示选项列表
    tanchuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tanchuBtn setBackgroundImage:[UIImage imageNamed:@"btn_foldup.png"] forState:UIControlStateNormal];
    tanchuBtn.frame = CGRectMake(120,325, 80, 40);
    [tanchuBtn addTarget:self action:@selector(tanchuIsPressed:) forControlEvents:UIControlEventTouchUpInside];    
    [self.view addSubview:tanchuBtn];
}

//答案列表页
-(void)answerListView
{
    NSLog(@"答案选项列表已经按下!");
    //列表页    
    answerList = [[UITextView alloc]initWithFrame:CGRectMake(0, 266, 320, 145)];
    answerList.font = [UIFont systemFontOfSize:16];
    answerList.backgroundColor = [UIColor clearColor];
    //answerList.scrollEnabled = YES;
    answerList.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    answerList.editable = NO;
    answerList.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_answersheet.png"]];
    [self.view addSubview:answerList];
    
 
    for(int i= 0;i<20;i++)
    {
        //NSLog(@"hint = %@",[[array objectAtIndex:i] hint1]);
        [self singerAnswerList:(int)i];
    }
        //NSLog(@"answer = %@",childid);
    [self.view addSubview:answerList];
    
}
//设计选项列表框
-(void)singerAnswerList:(int)i
{
    //选项列表
    self.result =@"";//置答案为空
    
    
    if([[hsTiku hint1]isEqualToString:@"null"]){
        
    }
    else{
        self.tishiBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        tishiBtn.frame = CGRectMake(240, 5+i*130, 60,30 );
        self.mark = 0;
        [self.tishiBtn setBackgroundImage:[UIImage imageNamed:@"btn_prompt_normal.png"] forState:UIControlStateNormal];
        //[tishiBtn setTitle:@"提示" forState:UIControlStateNormal];
        [tishiBtn addTarget:self action:@selector(tishiBtnIsPressed:) forControlEvents:UIControlEventTouchUpInside];
        [answerList addSubview:tishiBtn];
    }
    
    self.list1btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list2btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list3btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list4btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list1Label = [[UILabel alloc]init];
    self.list2Label = [[UILabel alloc]init];
    self.list3Label = [[UILabel alloc]init];
    self.list4Label = [[UILabel alloc]init];
    
    list1btn.frame = CGRectMake(10, self.tishiBtn.frame.origin.y + 30+i*100, 20, 20);
    list2btn.frame = CGRectMake(10, self.list1btn.frame.origin.y + 30+i*100, 20, 20);
    list3btn.frame = CGRectMake(10, self.list2btn.frame.origin.y + 30+i*100, 20, 20);
    list4btn.frame = CGRectMake(10, self.list3btn.frame.origin.y + 30+i*100, 20, 20);
    list1Label.frame = CGRectMake(40, self.list1btn.frame.origin.y , 260, 20);
    list2Label.frame = CGRectMake(40, self.list2btn.frame.origin.y , 260, 20);
    list3Label.frame = CGRectMake(40, self.list3btn.frame.origin.y , 260, 20);
    list4Label.frame = CGRectMake(40, self.list4btn.frame.origin.y , 260, 20);
    
    list1btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list2btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list3btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list4btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    
    HSTiku *hsTikuTemp = [self.array objectAtIndex:i];
    
    list1Label.text = [hsTikuTemp select1];
    list2Label.text = [hsTikuTemp select2];
    list3Label.text = [hsTikuTemp select3];
    list4Label.text = [hsTikuTemp select4];
    
    list1Label.backgroundColor = [UIColor clearColor];
    list2Label.backgroundColor = [UIColor clearColor];
    list3Label.backgroundColor = [UIColor clearColor];
    list4Label.backgroundColor = [UIColor clearColor];
    
    [self.list1btn addTarget:self action:@selector(listAnswerBtn1IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list2btn addTarget:self action:@selector(listAnswerBtn2IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list3btn addTarget:self action:@selector(listAnswerBtn3IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list4btn addTarget:self action:@selector(listAnswerBtn4IsPressed:) forControlEvents:UIControlEventTouchUpInside];

    [answerList addSubview:list1btn];
    [answerList addSubview:list2btn];
    [answerList addSubview:list3btn];
    [answerList addSubview:list4btn];
    [answerList addSubview:list1Label];
    [answerList addSubview:list2Label];
    [answerList addSubview:list3Label];
    [answerList addSubview:list4Label];
}
//题目选项框按钮响应
-(void)tanchuIsPressed:(id)sender
{
    if(xuanxiangSwitch%2 == 0)
    {
        NSLog(@"选项打开");
        [self.tanchuBtn setImage:[UIImage imageNamed:@"btn_folddown.png"] forState:UIControlStateNormal];
        [self.tanchuBtn setFrame:CGRectMake(120, 175, 80, 40)];
        [self.nextTitleBtn setFrame:CGRectMake(0, 280, 320, 50)];
        [self answerListView];
    }
    else
    {
        NSLog(@"选项关闭");
        [self.tanchuBtn setImage:[UIImage imageNamed:@"btn_foldup.png"] forState:UIControlStateNormal];
        [self.tanchuBtn setFrame:CGRectMake(120,325, 80, 40)];
        [self.nextTitleBtn setFrame:CGRectMake(0, 430, 320, 50)];
        [self.imageView setFrame:CGRectMake(0, 480, 320, 0)];
        self.answerList.hidden = YES;
    }
    xuanxiangSwitch ++;
}

//题目内容
-(void)titleContentCreen
{
    imgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImage *img = [UIImage imageNamed:@"background.png"];
    imgView.image = img;
    [self.view addSubview:imgView];
    
    UITextView * titleTextView = [[UITextView alloc]initWithFrame:imgView.bounds];
    titleTextView.text = titleName;
    NSLog(@"titleContent = %@",titleTextView.text);
    titleTextView.font = [UIFont systemFontOfSize:16];
    titleTextView.backgroundColor = [UIColor clearColor];
    titleTextView.scrollEnabled = YES;
    titleTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    titleTextView.editable = NO;
    [self.view addSubview:titleTextView];

}
//下一题按钮响应
-(void)nextPush:(UIButton *)sender
{
    
    // NSUInteger number = [array indexOfObject:self.hsTiku];
    if(row<20)
    {
        row++;
        HSTiku *tikuTemp = [array objectAtIndex:row];
        NSLog(@"***HS*** %d",row);
        HSXML *hsXML = [[HSXML alloc]init];
        hsXML.hsTiku = tikuTemp;
        hsXML.tiTitleId = [tikuTemp hsid];
        [hsXML viewDidLoad];
        self.hsTiku = hsXML.hsTiku;
        
        HSDanxuanViewController * hsNewDanxuan = [[HSDanxuanViewController alloc]init];
        hsNewDanxuan.hsTiku = self.hsTiku;
        hsNewDanxuan.array = self.array;
        hsNewDanxuan.row = self.row;
        [self.navigationController pushViewController:hsNewDanxuan animated:
         NO];
    }
    else
    {
        NSLog(@"下一题 溢出");
        [self.nextTitleBtn setTitle:@"没有更多题，请返回" forState:UIControlStateNormal];
    }
    
}

//提交答案按钮响应
-(void)resultAnswerBtnIsPressed:(UIButton *)sender
{
    [self.resultBtn setBackgroundImage:[UIImage imageNamed:@"btn_submit_pressed.png"] forState:UIControlStateNormal];
    
    if( 1==time )
    {
        self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(-2,self.list4Label.frame.origin.y+self.list4Label.frame.size.height+10,0,0)];
        CGSize size = CGSizeMake(320, 2000);
        NSString *correctAnswer = [hsTiku result];
        CGSize labelSize = [correctAnswer sizeWithFont:[UIFont fontWithName:@"Arial" size:15] constrainedToSize:size lineBreakMode:UILineBreakModeCharacterWrap];
        resultLabel.font = [UIFont fontWithName:@"Arial" size:15];
        [resultLabel setNumberOfLines:0];//自动换行
        [resultLabel setFrame:CGRectMake(-2, self.list4Label.frame.origin.y+self.list4Label.frame.size.height + 10, 420, labelSize.height)];
        [sview addSubview:resultLabel];
        resultLabel.backgroundColor = [UIColor clearColor];
        
        if([correctAnswer isEqualToString:self.result])
        {
            
            resultLabel.text =@"恭喜您回答正确";
        }
        else
        {
            NSString *wrong = [[NSString alloc] initWithFormat:@" 本题回答错误，您选择答案%@，正确答案:%@",self.result,correctAnswer];
            resultLabel.text = wrong;
        }
        [self.resultBtn setFrame:CGRectMake(120, self.resultLabel.frame.origin.y+self.resultLabel.frame.size.height+20, 80, 40)];
    }
    time --;
    [self.resultBtn setSelected:YES];
}
//选项列表1按钮响应
-(void)listAnswerBtn1IsPressed:(UIButton *)sender
{
    [list1btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:UIControlStateNormal];
    [list2btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list3btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list4btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    self.result = @"A";
}
//选项列表2按钮响应
-(void)listAnswerBtn2IsPressed:(UIButton *)sender
{
    [list1btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list2btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:UIControlStateNormal];
    [list3btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list4btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    self.result = @"B";
}
//选项列表3按钮响应
-(void)listAnswerBtn3IsPressed:(UIButton *)sender
{
    [list1btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list2btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list3btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:UIControlStateNormal];
    [list4btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    self.result = @"C";
}
//选项列表4按钮响应
-(void)listAnswerBtn4IsPressed:(UIButton *)sender
{
    [list1btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list2btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list3btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_off.png"] forState:UIControlStateNormal];
    [list4btn setBackgroundImage:[UIImage imageNamed:@"btn_radio_on.png"] forState:UIControlStateNormal];
    self.result = @"D";
}

//提示按钮响应
-(void)tishiBtnIsPressed:(UIButton *)sender
{
    [self.tishiBtn setBackgroundImage:[UIImage imageNamed:@"btn_prompt_pressed.png"] forState:UIControlStateNormal];
    if(mark % 2 == 0)
    {
        
        self.tishiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,self.tishiBtn.frame.origin.y+40,0,0)];
        NSString *str = [NSString stringWithFormat:@"提示一：%@",[hsTiku hint1]];
        CGSize size = CGSizeMake(320, 2000);
        CGSize labelSize = [str sizeWithFont:[UIFont fontWithName:@"Arial" size:15] constrainedToSize:size lineBreakMode:UILineBreakModeCharacterWrap];
        tishiLabel.font = [UIFont fontWithName:@"Arial" size:15];
        tishiLabel.text =str;
        [tishiLabel setNumberOfLines:0];//自动换行
        [tishiLabel setFrame:CGRectMake(0, self.tishiBtn.frame.origin.y+self.tishiBtn.frame.size.height +10, labelSize.width, labelSize.height)];
        [sview addSubview:tishiLabel];
        tishiLabel.backgroundColor = [UIColor clearColor];
        //[tishiBtn setTitle:@"关闭" forState:UIControlStateNormal];
        
        list1btn.frame = CGRectMake(10, self.tishiLabel.frame.origin.y + self.tishiLabel.frame.size.height + 10, 20, 20);
        list2btn.frame = CGRectMake(10, self.list1btn.frame.origin.y + 30, 20, 20);
        list3btn.frame = CGRectMake(10, self.list2btn.frame.origin.y + 30, 20, 20);
        list4btn.frame = CGRectMake(10, self.list3btn.frame.origin.y + 30, 20, 20);
        list1Label.frame = CGRectMake(40, self.list1btn.frame.origin.y , 260, 20);
        list2Label.frame = CGRectMake(40, self.list2btn.frame.origin.y , 260, 20);
        list3Label.frame = CGRectMake(40, self.list3btn.frame.origin.y , 260, 20);
        list4Label.frame = CGRectMake(40, self.list4btn.frame.origin.y , 260, 20);
        
        
        [self.resultLabel setFrame:CGRectMake(-2, self.list4Label.frame.origin.y+self.list4Label.frame.size.height+3, 320, 50)];
        [self.resultBtn setFrame:CGRectMake(120, self.list4Label.frame.origin.y+self.list4Label.frame.size.height+50, 80, 40)];
    }
    if(mark % 2 == 1)
    {
        self.tishiLabel.hidden= YES;
        //[tishiBtn setTitle:@"提示" forState:UIControlStateNormal];
        [self.tishiBtn setBackgroundImage:[UIImage imageNamed:@"btn_prompt_normal.png"] forState:UIControlStateNormal];
        
        list1btn.frame = CGRectMake(10, self.tishiBtn.frame.origin.y + 40, 20, 20);
        list2btn.frame = CGRectMake(10, self.list1btn.frame.origin.y + 30, 20, 20);
        list3btn.frame = CGRectMake(10, self.list2btn.frame.origin.y + 30, 20, 20);
        list4btn.frame = CGRectMake(10, self.list3btn.frame.origin.y + 30, 20, 20);
        list1Label.frame = CGRectMake(40, self.list1btn.frame.origin.y , 260, 20);
        list2Label.frame = CGRectMake(40, self.list2btn.frame.origin.y , 260, 20);
        list3Label.frame = CGRectMake(40, self.list3btn.frame.origin.y , 260, 20);
        list4Label.frame = CGRectMake(40, self.list4btn.frame.origin.y , 260, 20);
        
        [self.resultBtn setFrame:CGRectMake(120, self.list4Label.frame.origin.y+self.list4Label.frame.size.height+50, 80, 40)];
        [self.resultLabel setFrame:CGRectMake(-2, self.list4Label.frame.origin.y+self.list4Label.frame.size.height+3, 320, 50)];
    }
    mark += 1;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

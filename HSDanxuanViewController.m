//
//  HSDanxuanViewController.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-8.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import "HSDanxuanViewController.h"

@interface HSDanxuanViewController ()

@end

@implementation HSDanxuanViewController
@synthesize hsTiku,hsArray,mark,resultLabel,tishiBtn,tishiLabel,titleLabel;
@synthesize list1btn,list2btn,list3btn,list4btn;
@synthesize list1Label,list2Label,list3Label,list4Label;
@synthesize sview,resultBtn,result,time;
@synthesize array,titleNum;
@synthesize nextTitleBtn;
@synthesize row;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //设置当前题目数
        self.titleNum = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -200, 320, 450)];
    UIImage *img = [UIImage imageNamed:@"bg_choose_grade.png"];
    imgView.image = img;
    sview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    sview.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //[sview setContentOffset:CGPointMake(0, 300) animated:YES];
    sview.showsHorizontalScrollIndicator = NO;
    sview.showsVerticalScrollIndicator = NO;
    sview.contentSize = CGSizeMake(320, 800);
    //sview.pagingEnabled = YES;
    [sview addSubview:imgView];
    [self.view addSubview:sview];
    
    NSString *strTil =[NSString stringWithFormat:@"%d年单选题",[hsTiku year]];
    self.title = strTil;    
    
    //试题  自适应文本高度的label
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,0,0)];
    NSLog(@"***HS*** titleID = %d",[hsTiku hsid]);
    NSLog(@"***HS*** titleContent = %@",[hsTiku titleContent]);
    
    NSString *str = [hsTiku titleContent];
    CGSize size = CGSizeMake(320, 2000);
    CGSize labelSize = [str sizeWithFont:[UIFont fontWithName:@"Arial" size:15] constrainedToSize:size lineBreakMode:UILineBreakModeMiddleTruncation];
    titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    titleLabel.text =str;
    [titleLabel setNumberOfLines:0];//自动换行
    [titleLabel setFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    titleLabel.backgroundColor = [UIColor clearColor];
    [sview addSubview:titleLabel]; 
    
    //提示按钮
    self.tishiBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tishiBtn.frame = CGRectMake(240, labelSize.height+5, 60,30 );
    self.mark = 0;
    [self.tishiBtn setBackgroundImage:[UIImage imageNamed:@"btn_prompt_normal.png"] forState:UIControlStateNormal];
    //[tishiBtn setTitle:@"提示" forState:UIControlStateNormal];
    [tishiBtn addTarget:self action:@selector(tishiBtnIsPressed:) forControlEvents:UIControlEventTouchUpInside];    
    [sview addSubview:tishiBtn];
    
    //选项列表
    self.result =@"";//置答案为空
    
    self.list1btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list2btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list3btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list4btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.list1Label = [[UILabel alloc]init];
    self.list2Label = [[UILabel alloc]init];
    self.list3Label = [[UILabel alloc]init];
    self.list4Label = [[UILabel alloc]init];
    
    list1btn.frame = CGRectMake(10, self.tishiBtn.frame.origin.y + 40, 20, 20);
    list2btn.frame = CGRectMake(10, self.list1btn.frame.origin.y + 30, 20, 20);
    list3btn.frame = CGRectMake(10, self.list2btn.frame.origin.y + 30, 20, 20);
    list4btn.frame = CGRectMake(10, self.list3btn.frame.origin.y + 30, 20, 20);
    list1Label.frame = CGRectMake(40, self.list1btn.frame.origin.y , 260, 20);
    list2Label.frame = CGRectMake(40, self.list2btn.frame.origin.y , 260, 20);
    list3Label.frame = CGRectMake(40, self.list3btn.frame.origin.y , 260, 20);
    list4Label.frame = CGRectMake(40, self.list4btn.frame.origin.y , 260, 20);
        
    list1btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list2btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list3btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    list4btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_radio_off.png"]];
    
    list1Label.text = [hsTiku select1];
    list2Label.text = [hsTiku select2];
    list3Label.text = [hsTiku select3];
    list4Label.text = [hsTiku select4];
    
    list1Label.backgroundColor = [UIColor clearColor];
    list2Label.backgroundColor = [UIColor clearColor];
    list3Label.backgroundColor = [UIColor clearColor];
    list4Label.backgroundColor = [UIColor clearColor];
    
    [self.list1btn addTarget:self action:@selector(listAnswerBtn1IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list2btn addTarget:self action:@selector(listAnswerBtn2IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list3btn addTarget:self action:@selector(listAnswerBtn3IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.list4btn addTarget:self action:@selector(listAnswerBtn4IsPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [sview addSubview:list1btn];
    [sview addSubview:list2btn];
    [sview addSubview:list3btn];
    [sview addSubview:list4btn];
    [sview addSubview:list1Label];
    [sview addSubview:list2Label];
    [sview addSubview:list3Label];
    [sview addSubview:list4Label];
    
    //提交答案按钮
    self.resultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resultBtn.frame = CGRectMake(120, self.list4Label.frame.origin.y+self.list4Label.frame.size.height+20, 80, 40);
    //[resultBtn setTitle:@"提交答案" forState:UIControlStateNormal];
    [resultBtn addTarget:self action:@selector(resultAnswerBtnIsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.resultBtn setBackgroundImage:[UIImage imageNamed:@"btn_submit_normal.png"] forState:UIControlStateNormal];
    [self.sview addSubview:resultBtn];
    
    self.time = 1;//答题次数
    
    //下一题按钮
    self.nextTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextTitleBtn setBackgroundImage:[UIImage imageNamed:@"titlebar.png"] forState:UIControlStateNormal];
    [nextTitleBtn setFrame:CGRectMake(0, 430, 320, 50)];
    [nextTitleBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [nextTitleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextTitleBtn addTarget:self action:@selector(nextPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarController.view addSubview:nextTitleBtn];
    
    //导航左上角
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftBarBtnIsPressed:)];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.nextTitleBtn removeFromSuperview];
}
//导航左上角响应
-(void)leftBarBtnIsPressed:(UIButton *)sender
{
    self.nextTitleBtn.hidden =  YES;
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
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

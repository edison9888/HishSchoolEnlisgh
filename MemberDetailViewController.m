//
//  MemberDetailViewController.m
//  my
//
//  Created by ibokan on 13-1-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MemberDetailViewController.h"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

@interface MemberDetailViewController ()

@end

@implementation MemberDetailViewController

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
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"geer.png"]];
    self.navigationItem.title=@"";
    [self memberLanding];//调用会员登陆界面
        
}

//会员登陆背景界面
-(void)memberLanding
{
    UIImage *memberImage=[UIImage imageNamed:@"bg_member_login.png"];
    memberView=[[UIImageView alloc]initWithFrame:(CGRectMake(30, 60, 260, 220))];
    memberView.image=memberImage;
    [self.view addSubview:memberView];//添加背景
    [self setUserPersonalInformation];
   
}

//登陆界面的设计
-(void)setUserPersonalInformation
{
    UIView *user=[[UIView alloc]initWithFrame:(CGRectMake(20, 50, 228, 30))];
    user.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_input.png"]];
    UITextField *userName=[[UITextField alloc]initWithFrame:(CGRectMake(120, 113, 150, 30))];
    userName.delegate=self;
    userName.placeholder=@"请输入用户名";
    UILabel *userLable=[[UILabel alloc]initWithFrame:(CGRectMake(10, 0, 60, 30))];
    userLable.backgroundColor=[UIColor clearColor];
    userLable.text=@"用户名:";
    userLable.textColor=[UIColor cyanColor];
    userName.returnKeyType=UIReturnKeyDone;
    UIView *passrd=[[UIView alloc]initWithFrame:(CGRectMake(20, 85, 228, 30))];
    passrd.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_input.png"]];
    UITextField *passrdName=[[UITextField alloc]initWithFrame:(CGRectMake(120, 150, 150, 30))];
    passrdName.placeholder=@"请输入密码";
    passrdName.secureTextEntry=YES;
    passrdName.delegate=self;
    passrdName.returnKeyType=UIReturnKeyDone;
    passrdName.userInteractionEnabled=YES;
    UILabel *passrdLable=[[UILabel alloc]initWithFrame:(CGRectMake(10, 0, 60, 30))];
    passrdLable.backgroundColor=[UIColor clearColor];
    passrdLable.text=@" 密码:";
    passrdLable.textColor=[UIColor cyanColor];
    
    [passrd addSubview:passrdLable];
    [user addSubview:userLable];
    [memberView addSubview:passrd];
    [memberView addSubview:user];
    [self.view addSubview:passrdName];
    [self.view addSubview:userName];//登录信息验证
    
    UIButton *dengBut=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    dengBut.frame=CGRectMake(20, 80, 80, 40);
    [dengBut setTitle:@"登录" forState:(UIControlStateNormal)];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *ct;
    ct=[[NSCharacterSet characterSetWithCharactersInString:ALPHANUM]invertedSet];
    NSString *file=[[string componentsSeparatedByCharactersInSet:ct]componentsJoinedByString:@""];
    if (![string isEqualToString:file]) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入字母和数字" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil];
        [alert show];
        [alert release];
        return NO;
    }
    return [string isEqualToString:file];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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

//
//  HSTikuDetailViewController.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-7.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TikuContentViewController.h"
#import "HSTiku.h"
#import "HSXML.h"
#import "HSDanxuanViewController.h"
#import "HSYueduViewController.h"
#import "HSWanxingViewController.h"
#import "HSYuyinViewController.h"
#import "HSBuquanViewController.h"
#import "HSDuanwenViewController.h"
#import "HSShumianViewController.h"
#import "HSDanciViewController.h"
#import "HSBiaodaViewController.h"
#import "HSQingjingViewController.h"
#import "HSFanyiViewController.h"
#import "HSJuxingViewController.h"
#import "WXXML.h"
@interface HSTikuDetailViewController : UITableViewController<NSXMLParserDelegate>
{
    HSTiku *hsTiku;
    NSMutableArray *array;
    NSMutableString * str;
    NSMutableDictionary * dic;
    
    NSString *year;
    int grade;
    int tag;
    int delTitleType;
}
@property int delTitleType;
@property int grade;
@property int tag;
@property(nonatomic,retain)NSString *year;
@property(nonatomic,strong)UITableView * myTableView;
@property(nonatomic,strong)HSTiku *hsTiku;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableString * str;
@property(nonatomic,strong)NSMutableDictionary * dic;

@end

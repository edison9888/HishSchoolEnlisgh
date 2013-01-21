//
//  HSTikuDetailViewController.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-7.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//
extern int grad;
#import "HSTikuDetailViewController.h"

@interface HSTikuDetailViewController ()

@end

@implementation HSTikuDetailViewController
@synthesize myTableView,hsTiku,dic,array,str,year;
@synthesize grade,tag;
@synthesize delTitleType;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    
        //*************************************
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:@"title_smart.png"];
        [imageView setImage:image];
        self.navigationItem.titleView = imageView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"***HS***-------year-------- %@",self.year);
//    NSLog(@"***HS***-------GRADE------- %d",GRADE);
    NSLog(@"***HS***-------TitleType编号--- %d",self.tag);
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.myTableView];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    array = [[NSMutableArray alloc]init];
    str = [[NSMutableString alloc]init];
    dic = [[NSMutableDictionary alloc]init];
    NSLog(@"解析开始！");
    [self startParsering];
    NSLog(@"解析结束！");

}
//启动创建器
-(void)startParsering
{
    NSLog(@"进入URL");
    //年级解析转化
    int gradeNum = 0;
    switch(grad)
    {
        case 1:
        {
            gradeNum = 10;
        }break;
        case 2:
        {
            gradeNum = 11;
        }break;
        case 3:
        {
            gradeNum = 12;
        }break;
    }
    //年份解析转化
    NSString * yearStr ;
    if([year isEqualToString:@"不限"]){
        yearStr = @"";
    }
    else{
        yearStr = year;
    }
    //题型解析转化
    int tagNum;
    switch(tag)
    {
        case 1:
        {
            tagNum = 1;
        }break;
        case 2:
        {
            tagNum = 13;
        }break;
        case 3:
        {
            tagNum = 14;
        }break;
        case 4:
        {
            tagNum = 15;
        }break;
        case 5:
        {
            tagNum = 16;
        }break;
        case 6:
        {
            tagNum = 17;
        }break;
        case 7:
        {
            tagNum = 18;
        }break;
        case 8:
        {
            tagNum = 19;
        }break;
        case 9:
        {
            tagNum = 20;
        }break;
        case 10:
        {
            tagNum = 21;
        }break;
        case 11:
        {
            tagNum = 24;
        }break;
        case 12:
        {
            tagNum = 28;
        }break;
    }
    
    self.delTitleType = tagNum;
    NSLog(@"***HS***进入url解析数据校对:年级编码gradeNum = %d,年份编码yearNum = %@,题目类别编码titletype=%d",gradeNum,yearStr,delTitleType);
    
    NSMutableString * path = [[NSMutableString alloc]initWithFormat:@"http://api.winclass.net/serviceaction.do?method=themelibrary&subjectid=3&pagesize=20&currentpagenum=1&gread=%d&titletype=%d&year=%@",gradeNum,delTitleType,yearStr];
    
    NSLog(@"***HS*** path===========%@",path);

    NSURL *newsURL =  [[NSURL alloc]initWithString:path];
    NSData *xmlData = [[NSData alloc]initWithContentsOfURL:newsURL];
    NSXMLParser * parserTool = [[NSXMLParser alloc]initWithData:xmlData];
    parserTool.delegate = self;
    [parserTool parse];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    //NSLog(@"*************111111******************");
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"*************2222222******************");
    if([elementName isEqualToString:@"item"])
    {
        [dic removeAllObjects];
    }
    else if([elementName isEqualToString:@"id"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"title"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"year"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"createdate"])
    {
        [str setString:@""];
    }
  
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog(@"*************333333******************");
    [str appendString:string];
    //NSLog(@"***HS*** 字段====str===========%@",str);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //NSLog(@"*************444444******************");
    if([elementName isEqualToString:@"item"])
    {
        [array addObject:[NSMutableDictionary dictionaryWithDictionary:dic]];
    }
    else if([elementName isEqualToString:@"id"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"title"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"year"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"createdate"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    //NSLog(@"*************555555******************");
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (id element in array)
    {
        HSTiku *tiku = [[HSTiku alloc]init];
        tiku.hsid = [[element objectForKey:@"id"]intValue];
        tiku.title = [element objectForKey:@"title"];
        tiku.createdate = [element objectForKey:@"createdate"];
        tiku.year = [[element objectForKey:@"year"]intValue];
        
//        NSLog(@"id = %d",tiku.hsid);
//        NSLog(@"title = %@",tiku.title);
//        NSLog(@"year = %d",tiku.year);
//        NSLog(@"createdate = %@",tiku.createdate);
//        NSLog(@"  ");
        
        [tempArray addObject:tiku];
    }
    [array removeAllObjects];
    array = tempArray;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    NSUInteger i=[indexPath row];
    cell.textLabel.text = [NSString stringWithFormat:@"Section为 %ld的样式, Cell %d", (long)indexPath.section,i];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    hsTiku = [array objectAtIndex:indexPath.row];
      
    cell.textLabel.text= [hsTiku title];
    NSString *detailStr = [NSString stringWithFormat:@"%d单选题    %@",[hsTiku year],[hsTiku createdate]];
    cell.detailTextLabel.text = detailStr;
//    cell.detailTextLabel.textAlignment = kCTRightTextAlignment;    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"bg_point.png"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    NSUInteger i=[indexPath row];
    NSLog(@"%@",[NSString stringWithFormat:@"第%ld个区域，第%d个单元格 被选中",(long)indexPath.section,i]);
    
    HSTiku *tikuTemp = [array objectAtIndex:indexPath.row];
    HSXML *hsXML = [[HSXML alloc]init];
    hsXML.hsTiku = tikuTemp;
    hsXML.tiTitleId = [tikuTemp hsid];
    hsXML.tiTitleType = self.delTitleType;
    [hsXML viewDidLoad];
    
    //NSLog(@"array count=%d",[array count]);
    switch ([hsXML tiTitleType])
    {
        case 1:
        {
            HSDanxuanViewController *hsDan = [[HSDanxuanViewController alloc]init];
            hsDan.hsTiku = hsXML.hsTiku;
            hsDan.array = array;
            hsDan.row = indexPath.row;
            NSLog(@"***HS***  titleContent = %@",hsDan.hsTiku.titleContent);
            [self.navigationController pushViewController:hsDan animated:YES];
        }break;
        case 13:
        {
            HSYuyinViewController *hsYuyin = [[HSYuyinViewController alloc]init];
            hsYuyin.hsTiku = hsXML.hsTiku;
            hsYuyin.array = array;
            hsYuyin.row = indexPath.row;
            [self.navigationController pushViewController:hsYuyin animated:YES];
        }break;
        case 14:
        {
            NSLog(@"进入完形填空");

            HSWanxingViewController *hsWanxing = [[HSWanxingViewController alloc]init];
            
            HSTiku *tikuTemp = [array objectAtIndex:indexPath.row];
            WXXML *wxXML = [[WXXML alloc]init];
            wxXML.hsTiku = tikuTemp;
            wxXML.tiTitleId = [tikuTemp hsid];
            wxXML.tiTitleType = self.delTitleType;
            [wxXML viewDidLoad];
            
            hsWanxing.hsTiku = wxXML.hsTiku;
            hsWanxing.array = wxXML.array;
            
            NSLog(@"hsTiku = %@",[hsWanxing.hsTiku hint1]);
            NSLog(@"index = %d",[hsWanxing.array indexOfObject:hsWanxing.hsTiku]);
            hsWanxing.row = indexPath.row;
            hsWanxing.titleName = [wxXML.dic2 valueForKey:@"title"];
            hsWanxing.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:hsWanxing animated:YES];
        }break;
        case 15:
        {
            HSYueduViewController *hsYuedu = [[HSYueduViewController alloc]init];
            [self.navigationController pushViewController:hsYuedu animated:YES];
        }break;
        case 16:
        {
            HSBuquanViewController *hsBuquan = [[HSBuquanViewController alloc]init];
            [self.navigationController pushViewController:hsBuquan animated:YES];
        }break;
        case 17:
        {
            HSDuanwenViewController *hsDuwnwen = [[HSDuanwenViewController alloc]init];
            [self.navigationController pushViewController:hsDuwnwen animated:YES];
        }break;
        case 18:
        {
            HSShumianViewController *hsShumian = [[HSShumianViewController alloc]init];
            [self.navigationController pushViewController:hsShumian animated:YES];
        }break;
        case 19:
        {
            HSDanciViewController *hsDanci = [[HSDanciViewController alloc]init];
            [self.navigationController pushViewController:hsDanci animated:YES];
        }break;
        case 20:
        {
            HSBiaodaViewController *hsBiaoda = [[HSBiaodaViewController alloc]init];
            [self.navigationController pushViewController:hsBiaoda animated:YES];
        }break;
        case 21:
        {
            HSQingjingViewController *hsQingjing = [[HSQingjingViewController alloc]init];
            [self.navigationController pushViewController:hsQingjing animated:YES];
        }break;
        case 24:
        {
            HSFanyiViewController *hsFanyi = [[HSFanyiViewController alloc]init];
            [self.navigationController pushViewController:hsFanyi animated:YES];
        }break;
        case 28:
        {
            HSJuxingViewController *hsJuxing = [[HSJuxingViewController alloc]init];
            [self.navigationController pushViewController:hsJuxing animated:YES];
        }break;
    }
    
     //[self.navigationController pushViewController:contentViewController animated:YES];
}

@end

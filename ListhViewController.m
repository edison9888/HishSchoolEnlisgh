//
//  ListhViewController.m
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

#import "ListhViewController.h"

@interface ListhViewController ()

@end

@implementation ListhViewController
@synthesize listh,str,sUrl,array,dic;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    array=[[NSMutableArray alloc]init];
    dic=[[NSMutableDictionary alloc]init];
    str =[[NSMutableString alloc]init];
    
//    NSString *s=@"http://api.winclass.net/serviceaction.do?method=getlisteningthemes&subjectid=3&currentpagenum=1&pagesize=30&gread=0&listentype=610&year=";
    NSURL *url=[[NSURL alloc]initWithString:self.sUrl];
    NSData *xmlData=[[NSData alloc]initWithContentsOfURL:url];
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:xmlData];
    parser.delegate=self;
    [parser parse];
}
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *tempStr=[Listh genHtmlStr:string];
    [str appendString:[Listh flattenHTML:tempStr]];
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"item"]) {
        [dic removeAllObjects];
    }
    else if ([elementName isEqualToString:@"id"])
    {
        [str setString:@""];
    }

    else if ([elementName isEqualToString:@"title"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"optiona"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"optionb"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"optionc"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"optiond"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"answer"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"createdate"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"original"])
    {
        [str setString:@""];
    }
    else if ([elementName isEqualToString:@"midfile"])
    {
        [str setString:@""];
    }
//    NSLog(@"***************%@",self.sUrl);
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        [array addObject:[NSMutableDictionary dictionaryWithDictionary:dic]];
    }
    else if ([elementName isEqualToString:@"id"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }

    else if ([elementName isEqualToString:@"title"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"optiona"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"optionb"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"optionc"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"optiond"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"answer"])
    {
       [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"createdate"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"original"])
    {
        [dic setObject:[NSString stringWithString:[Listh flattenHTML:str]] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"midfile"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }

}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSMutableArray *tempArray=[[NSMutableArray alloc]init];
    for (id element in array) {
        Listh *tempListh=[[Listh alloc]init];
        
        tempListh.title=[element objectForKey:@"title"];
        tempListh.optionA=[element objectForKey:@"optiona"];
        tempListh.optionB=[element objectForKey:@"optionb"];
        tempListh.optionC=[element objectForKey:@"optionc"];
        tempListh.optionD=[element objectForKey:@"optiond"];
        tempListh.answer=[element objectForKey:@"answer"];
        tempListh.newData=[element objectForKey:@"createdate"];
        tempListh.original=[element objectForKey:@"original"];
        tempListh.midFile=[element objectForKey:@"midfile"];
        tempListh.midID=[element objectForKey:@"id"];
        if (tempListh.title!=nil) {
            [tempArray addObject:tempListh];
        }
        
//        NSLog(@"%@",tempListh.url);
    }
    [array removeAllObjects];
    array=tempArray;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [array count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:CellIdentifier];
    }
    Listh *tempLish=[array objectAtIndex:indexPath.row];
  
    cell.textLabel.text=tempLish.title;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",tempLish.newData];
    cell.imageView.image=[UIImage imageNamed:@"bg_point.png"];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    DetaiViewController *detai=[[DetaiViewController alloc]init];
    detai.listh=[array objectAtIndex:indexPath.row];
    detai.copyArray=array;
    detai.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detai animated:YES];
}

@end

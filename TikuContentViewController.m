//
//  TikuContentViewController.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-6.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import "TikuContentViewController.h"

@interface TikuContentViewController ()

@end

@implementation TikuContentViewController
@synthesize hsTiku;
@synthesize array,str,dic;
@synthesize tiTitleId,tiTitleType;
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
    NSLog(@"TikuContentView *************titleType＝%d",self.tiTitleType);
    NSLog(@"TikuContentView *************id＝%d",self.tiTitleId);
	// Do any additional setup after loading the view.
    
    
    array = [[NSMutableArray alloc]init];
    str = [[NSMutableString alloc]init];
    dic = [[NSMutableDictionary alloc]init];
    NSLog(@"解析开始！");
    [self startParsering];
    NSLog(@"解析结束！");


}
-(void)startParsering
{
    
    NSMutableString * path = [[NSMutableString alloc]initWithFormat:@"http://api.winclass.net/serviceaction.do?method=gettheme&subjectid=3&id=%d",self.tiTitleId];
    
    NSLog(@"path===========%@",path);
    
    NSURL *newsURL =  [[NSURL alloc]initWithString:path];
    NSData *xmlData = [[NSData alloc]initWithContentsOfURL:newsURL];
    NSXMLParser * parserTool = [[NSXMLParser alloc]initWithData:xmlData];
    parserTool.delegate = self;
    [parserTool parse];
}
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"*************111111******************");
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"*************2222222******************");
    NSLog(@"=======================%@",elementName);
    if([elementName isEqualToString:@"item"])
    {
        [dic removeAllObjects];
    }
    else if([elementName isEqualToString:@"id"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"createdate"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"difficulty"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"select1"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"select2"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"select3"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"select4"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"select5"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"result"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"hint1"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"hint2"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"hint3"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"hint4"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"hint5"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"childid"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"department"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"objective"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"soundfile"])
    {
        [str setString:@""];
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"*************333333******************");
    [str appendString:string];
    NSLog(@"%@",str);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"*************444444******************");
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
    else if([elementName isEqualToString:@"difficulty"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"select1"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"select2"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"select3"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"select4"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"select5"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"result"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"hint1"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"hint2"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"hint3"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"hint4"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"hint5"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"childid"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"department"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    else if([elementName isEqualToString:@"parentid"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    
    else if([elementName isEqualToString:@"createdate"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
        NSLog(@"AAAAAAAAAAAAAAAA%@",[dic valueForKey:elementName]);
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"*************555555******************");
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (id element in array)
    {
        HSTiku *tiku = [[HSTiku alloc]init];
        tiku.difficulty = [[element objectForKey:@"difficulty"]intValue];
        tiku.select1 = [element objectForKey:@"select1"];
        tiku.select2 = [element objectForKey:@"select2"];
        tiku.select3 = [element objectForKey:@"select3"];
        tiku.select4 = [element objectForKey:@"select4"];
        tiku.select5 = [element objectForKey:@"select5"];
        tiku.result = [element objectForKey:@"result"];
        tiku.hint1 = [element objectForKey:@"hint1"];
        tiku.hint2 = [element objectForKey:@"hint2"];
        tiku.hint3 = [element objectForKey:@"hint3"];
        tiku.hint4 = [element objectForKey:@"hint4"];
        tiku.hint5 = [element objectForKey:@"hint5"];

        
        NSLog(@"XXXXXXXXXXX=======array = %@",array);
               
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

@end

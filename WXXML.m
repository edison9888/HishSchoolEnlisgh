//
//  HSXML.m
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-8.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import "WXXML.h"

@implementation WXXML
@synthesize hsTiku;
@synthesize array,str,dic;
@synthesize tiTitleId,tiTitleType;
@synthesize dic2,countItem;
+(NSString *) genHtmlStr:(NSString *)str
{
    NSMutableString *htmlStr = [NSMutableString stringWithString:str];
    
    NSDictionary * replacements = [NSDictionary dictionaryWithObjectsAndKeys:@"<", @"&lt;", @">", @"&gt;", @"&", @"&amp;", @"'", @"&apos;", @"\"", @"&quot;",@" ", @"&nbsp;",@"“", @"&quot;",@"",@"&#xd;", nil];
    for (NSString * htmlEntity in replacements)
    {
        [htmlStr replaceOccurrencesOfString:htmlEntity withString:[replacements objectForKey:htmlEntity] options:0 range:NSMakeRange(0, [htmlStr length])];
    }
    return [[NSString alloc] initWithString:htmlStr];
}
+(NSMutableData *)replaceHtmlEntities:(NSMutableData *)data
{
    NSString *htmlCode = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
    NSMutableString *temp = [NSMutableString stringWithString:htmlCode];
    [temp replaceOccurrencesOfString:@"&" withString:@"&" options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
    [temp replaceOccurrencesOfString:@" " withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
    [temp replaceOccurrencesOfString:@"À" withString:@"à" options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
    NSData *finalData = [temp dataUsingEncoding:NSISOLatin1StringEncoding];
    [data setData:finalData];
    return data;
}


+(NSString *)flattenHTML:(NSString *)htmlstr{
    NSScanner *theScanner;
    NSMutableString *text = nil;
    theScanner = [NSScanner scannerWithString:htmlstr];
    while ([theScanner isAtEnd] == NO) {
        [theScanner scanUpToString:@"<" intoString:NULL];
        [theScanner scanUpToString:@">" intoString:&text];
        htmlstr = [htmlstr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@"_"];
    }
    return [[NSString alloc] initWithString:htmlstr] ;
}

- (void)viewDidLoad
{
    array = [[NSMutableArray alloc]init];
    str = [[NSMutableString alloc]init];
    dic = [[NSMutableDictionary alloc]init];
    dic2 = [[NSMutableDictionary alloc]init];
    NSLog(@"解析开始！");
    [self startParsering];
    NSLog(@"解析结束！");
    [self save];
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
    //NSLog(@"*************111111******************");
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"*************2222222******************");
    //NSLog(@"=======================%@",elementName);
    //NSLog(@"countItem =%d",countItem);
    if(countItem == 0)
    {
    if([elementName isEqualToString:@"item"])
    {
        [dic2 removeAllObjects];
        countItem ++;
    }
        
    }
        if([elementName isEqualToString:@"item"])
        {
            [dic removeAllObjects];
        }
    if([elementName isEqualToString:@"id"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"year"])
    {
        [str setString:@""];
    }
    else if([elementName isEqualToString:@"title"])
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
    //NSLog(@"*************333333******************");
    NSString *tempStr=[WXXML genHtmlStr:string];
    [str appendString:[WXXML flattenHTML:tempStr]];
    //[str appendString:string];
    //NSLog(@"%@",str);
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
    else if([elementName isEqualToString:@"year"])
    {
        [dic setObject:[NSString stringWithString:str] forKey:elementName];
    }
    
    else if([elementName isEqualToString:@"title"])
    {
        if(countItem==1)
        {
            [dic2 setObject:[NSString stringWithString:str] forKey:elementName];
            NSLog(@"dic2 = %@",dic2);
            countItem++;
        }
        
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
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    //NSLog(@"*************555555******************");
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (id element in array)
    {
        HSTiku *tiku = [[HSTiku alloc]init];
        tiku.titleContent = [element objectForKey:@"title"];
        tiku.year = [[element objectForKey:@"year"]intValue];
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
        tiku.hsid = [[element objectForKey:@"id"]intValue];
        
        [tempArray addObject:tiku];
        //NSLog(@"***********%@",tiku.titleContent);
        NSLog(@"array = %@",array);
        //NSLog(@"dic = %@**********",dic);
        //NSLog(@"dic2= %@**********",dic2);
        
    }
    [array removeAllObjects];
    array = tempArray;
    
}
-(NSArray *)save
{
    self.hsTiku = [array objectAtIndex:0];
    return array;
}
@end

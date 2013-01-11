//
//  Listh.m
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//
/*
 +(NSString *) genHtmlStr:(NSString *)str
 {
 NSMutableString *htmlStr = [NSMutableString stringWithString:str];
 
 NSDictionary * replacements = [NSDictionary dictionaryWithObjectsAndKeys:@"<", @"&lt;", @">", @"&gt;", @"&", @"&amp;", @"'", @"&apos;", @"\"", @"&quot;", nil];
 for (NSString * htmlEntity in replacements)
 {
 [htmlStr replaceOccurrencesOfString:htmlEntity withString:[replacements objectForKey:htmlEntity] options:0 range:NSMakeRange(0, [htmlStr length])];
 }
 
 return [[[NSString alloc] initWithString:htmlStr] autorelease];
 }

*/
#import "Listh.h"

@implementation Listh
@synthesize url,optionA,optionB,optionC,optionD,original,answer,midFile,midID;

+(NSString *) genHtmlStr:(NSString *)str
{
    NSMutableString *htmlStr = [NSMutableString stringWithString:str];
    
    NSDictionary * replacements = [NSDictionary dictionaryWithObjectsAndKeys:@"<", @"&lt;", @">", @"&gt;", @"&", @"&amp;", @"'", @"&apos;", @"\"", @"&quot;",@"", @"&nbsp;",@"“", @"&quot;",@"",@"&#xd;", nil];
    for (NSString * htmlEntity in replacements)
    {
        [htmlStr replaceOccurrencesOfString:htmlEntity withString:[replacements objectForKey:htmlEntity] options:0 range:NSMakeRange(0, [htmlStr length])];
    }
    
    return [[[NSString alloc] initWithString:htmlStr] autorelease];
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
    [htmlCode release];
    return data;
}
//+(NSMutableData *)replaceHtmlEntities:(NSMutableData *)data
//{
//    NSString *htmlCode = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
//    NSMutableString *temp = [NSMutableString stringWithString:htmlCode];
//    [temp replaceOccurrencesOfString:@"&" withString:@"&" options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
//    [temp replaceOccurrencesOfString:@" " withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
//    [temp replaceOccurrencesOfString:@"À" withString:@"à" options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
//    NSData *finalData = [temp dataUsingEncoding:NSISOLatin1StringEncoding];
//    [data setData:finalData];
//    [htmlCode release];
//    return data;
//}


+(NSString *)flattenHTML:(NSString *)htmlstr{
    NSScanner *theScanner;
    NSMutableString *text = nil;
    theScanner = [NSScanner scannerWithString:htmlstr];
    while ([theScanner isAtEnd] == NO) {
        [theScanner scanUpToString:@"<" intoString:NULL];
        [theScanner scanUpToString:@">" intoString:&text];
        htmlstr = [htmlstr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return [[[NSString alloc] initWithString:htmlstr] autorelease]
    ;
}



@end

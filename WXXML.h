//
//  HSXML.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-8.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSTiku.h"
@interface WXXML : NSObject<NSXMLParserDelegate>
{
    HSTiku *hsTiku;
    NSMutableArray *array;
    NSMutableString * str;
    NSMutableDictionary * dic;
    NSMutableDictionary * dic2;
    
    int tiTitleType;
    int tiTitleId;
    int countItem;
}
@property(nonatomic,strong)NSMutableDictionary * dic2;
@property int countItem;

@property int tiTitleType;
@property int tiTitleId;
@property(nonatomic,strong)HSTiku * hsTiku;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableString * str;
@property(nonatomic,strong)NSMutableDictionary * dic;

- (void)viewDidLoad;
-(NSArray *)save;
+(NSString *)flattenHTML:(NSString *)htmlstr;
+(NSString *) genHtmlStr:(NSString *)str;
+(NSMutableData *)replaceHtmlEntities:(NSMutableData *)data;
@end

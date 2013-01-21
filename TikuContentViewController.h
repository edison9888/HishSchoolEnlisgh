//
//  TikuContentViewController.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-6.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSTiku.h"
@interface TikuContentViewController : UIViewController<NSXMLParserDelegate>
{
    HSTiku *hsTiku;
    NSMutableArray *array;
    NSMutableString * str;
    NSMutableDictionary * dic;
    
    int tiTitleType;
    int tiTitleId;
}
@property int tiTitleType;
@property int tiTitleId;
@property(nonatomic,strong)HSTiku * hsTiku;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableString * str;
@property(nonatomic,strong)NSMutableDictionary * dic;
@end

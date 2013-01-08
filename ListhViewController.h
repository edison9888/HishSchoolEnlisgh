//
//  ListhViewController.h
//  my
//
//  Created by ibokan on 13-1-6.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listh.h"
#import "DetaiViewController.h"

@interface ListhViewController : UITableViewController<NSXMLParserDelegate>
{
    NSString *sUrl;
    NSMutableArray *array;
    NSMutableString *str;
    NSMutableDictionary *dic;
    Listh *listh;
}
@property(nonatomic,retain)NSString *sUrl;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSMutableString *str;
@property(nonatomic,retain)NSMutableDictionary *dic;
@property(nonatomic,retain)Listh *listh;

@end

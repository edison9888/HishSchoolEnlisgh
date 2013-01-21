//
//  HSTiku.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-7.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSTiku : NSObject
{
    int hsid;    
    int year;
    NSString * title;
    NSDate * createdate;
    
    int type;
    int pagesize;
    int titletype;

    
    int difficulty;
    NSString * titleContent;
    NSString * select1;
    NSString * select2;
    NSString * select3;
    NSString * select4;
    NSString * select5;
    NSString * result;
    NSString * hint1;
    NSString * hint2;
    NSString * hint3;
    NSString * hint4;
    NSString * hint5;
}
@property (nonatomic)NSString * titleContent;
@property (nonatomic)int difficulty;
@property int year;
@property (nonatomic,strong)NSString * select1;
@property (nonatomic,strong)NSString * select2;
@property (nonatomic,strong)NSString * select3;
@property (nonatomic,strong)NSString * select4;
@property (nonatomic,strong)NSString * select5;

@property (nonatomic,strong)NSString * result;
@property (nonatomic,strong)NSString * hint1;
@property (nonatomic,strong)NSString * hint2;
@property (nonatomic,strong)NSString * hint3;
@property (nonatomic,strong)NSString * hint4;
@property (nonatomic,strong)NSString * hint5;

@property (nonatomic)int type;
@property (nonatomic)int titletype;
@property (nonatomic)NSDate * createdate;
@property (nonatomic) int hsid;
@property (nonatomic,strong)NSString * title;
@end

//
//  Listh.h
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//
#import <Foundation/Foundation.h>

#define kNewData @"newData"
#define kUrl @"url"
#define kTitle @"title"
#define kOptionA @"optionA"
#define kOptionB @"optionB"
#define kOptionC @"optionC"
#define kOptionD @"optionD"
#define kAnswer @"answer"
#define kOriginal @"original"
#define kMidFile @"midFile"
#define kMidID @"midID"


@interface Listh : NSObject<NSCoding,NSCopying>
{
    NSData *newData;
    NSURL *url;
    NSString *title;
    NSString *optionA;
    NSString *optionB;
    NSString *optionC;
    NSString *optionD;
    NSString *answer;
    NSString *original;
    NSURL *midFile;
    NSString * midID;
}
@property(nonatomic,retain)NSData *newData;
@property(nonatomic,retain)NSURL *url;
@property(nonatomic,retain)NSURL *midFile;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *optionA;
@property(nonatomic,retain)NSString *optionB;
@property(nonatomic,retain)NSString *optionC;
@property(nonatomic,retain)NSString *optionD;
@property(nonatomic,retain)NSString *answer;
@property(nonatomic,retain)NSString *original;
@property(nonatomic,retain)NSString * midID;

+(NSString *) genHtmlStr:(NSString *)str;
+(NSString *)flattenHTML:(NSString *)htmlstr;
+(NSMutableData *)replaceHtmlEntities:(NSMutableData *)data;


@end

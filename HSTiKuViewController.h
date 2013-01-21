//
//  HSTiKuViewController.h
//  gaokaoyingyu
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Hu_Lian. All rights reserved.
//
#import <UIKit/UIKit.h>

//#import "TikuDetailViewController.h"

//#import "HSDicViewController.h"
//#import "HSListenViewController.h"
//#import "HSMoreViewController.h"
#import "HSTikuDetailViewController.h"


@interface HSTiKuViewController : UIViewController<UIScrollViewDelegate>
{
    int grade;
    NSString *year;
}
@property(nonatomic)int grade;
@property(nonatomic,retain)NSString *year;
@property(nonatomic,strong)UINavigationController *myNav;
@property(nonatomic,strong)UITabBarController *tabBar;
@end


//
//  LishViewController.h
//  my
//
//  Created by ibokan on 13-1-6.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKViewController.h"
#import "ListhViewController.h"

@interface LishViewController : UIViewController
{
    UIScrollView *sview;
    int gread;
     NSString *url;
}
@property(nonatomic,assign)int gread;
@property(nonatomic,retain) NSString *url;
@end

//
//  ViewController.m
//  UtilsFunction
//
//  Created by liuyanqi on 2016/10/18.
//  Copyright © 2016年 com.AiShows. All rights reserved.
//

#import "ViewController.h"
#import "UtilsFunction.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"----------%@",[UtilsFunction chineseWordSwitchIntoPinyinWith:@"你好这个世界"]);
    

}



@end

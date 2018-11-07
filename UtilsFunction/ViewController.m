//
//  ViewController.m
//  UtilsFunction
//
//  Created by liuyanqi on 2016/10/18.
//  Copyright © 2016年 com.maple. All rights reserved.
//

#import "ViewController.h"
#import "UtilsFunction.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"1----------%@",[UtilsFunction llCheckStringRemoveSpace:@"41042  14"]);
    NSLog(@"1----------%@",[UtilsFunction llCheckStringRemoveSpace:@"4101  4221914"]);
    NSLog(@"1----------%@",[UtilsFunction llCheckStringRemoveSpace:@"410~ !@# $%& 14"]);
    NSLog(@"1----------%@",[UtilsFunction llCheckStringRemoveSpace:@"410你+  好你 好"]);
    NSLog(@"1----------%@",[UtilsFunction llCheckStringRemoveSpace:@"    410好    "]);
    
}



@end




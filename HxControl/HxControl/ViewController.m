//
//  ViewController.m
//  HxControl
//
//  Created by han xiao on 2019/9/6.
//  Copyright © 2019 hanxiao. All rights reserved.
//

#import "ViewController.h"
#import "HxTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HxTextView *tv = [[HxTextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:tv];

    // Do any additional setup after loading the view.
}


@end

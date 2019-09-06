//
//  HxTextView.m
//  HxControl
//
//  Created by han xiao on 2019/9/6.
//  Copyright © 2019 hanxiao. All rights reserved.
//

#import "HxTextView.h"

@interface HxTextView()<UITextViewDelegate>

@end

@implementation HxTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self UIConfig];
    }
    return self;
}

/**
   **Display rich text above the textview**
 */
-(void)UIConfig{
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"哈哈123456"];
    // 设置“哈哈”为蓝色
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 2)];
    [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    
    // 设置“456”为红色
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 3)];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:24] range:NSMakeRange(5, 3)];
    [string addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(5, 3)];
    
    // 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"dianzan"];
    attach.bounds = CGRectMake(0, 0, 30, 30);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    
    
    [string appendAttributedString:attachString];
    
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:@"【推荐注册，赚现金红包】小生菜理财五四青年节，推荐注册赚现金红包，投资更有京东购物卡领取！截http://dwz.cn/5TtF1Q         爱你地久天长"]];
    
        NSString * str = [NSString stringWithFormat:@"This is an example by www.baidu.com/"];
    
        NSMutableAttributedString *as = [[NSMutableAttributedString alloc] initWithString:str]; // assume string exists
        NSRange urlRange = [str rangeOfString:@"www.baidu.com/"];
        [as addAttribute:NSLinkAttributeName
                       value:@"username://www.baidu.com/"
                       range:urlRange];
        [as addAttribute:NSForegroundColorAttributeName
                       value:[UIColor blueColor]
                       range:urlRange];
        [as addAttribute:NSUnderlineStyleAttributeName
                       value:@(NSUnderlineStyleSingle)
                       range:urlRange];
       [as addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:urlRange];
    
    
    [string appendAttributedString:as];

    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    textView.backgroundColor =[UIColor whiteColor];
    textView.delegate = self;
    [textView setEditable:NO];
    
    textView.attributedText = string;
    
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
    
    [self addSubview:textView];
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"url :%@",URL);
    if ([[URL scheme] isEqualToString:@"username"]) {
        NSString *username = [URL host];
        NSLog(@"username :%@",username);
        return NO;
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

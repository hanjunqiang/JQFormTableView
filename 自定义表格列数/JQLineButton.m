
//
//  JQLineButton.m
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQLineButton.h"

@interface JQLineButton()



@end

@implementation JQLineButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.jq_leftLine = [[UILabel alloc] init];
        self.jq_leftLine.backgroundColor = self.jq_lineColor?self.jq_lineColor:[UIColor blackColor];
        [self addSubview:self.jq_leftLine];
        
        self.jq_btn = [[UIButton alloc] init];
        self.jq_btn.titleLabel.numberOfLines = 0;
//        self.jq_btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.jq_btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.jq_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.jq_btn.titleLabel.font = [UIFont systemFontOfSize:self.jq_fontSize?self.jq_fontSize:10];
        [self.jq_btn setTitleColor:self.jq_fontColor?self.jq_fontColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.jq_btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.jq_btn];
        
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"self.jq_lineWidth---%f",self.jq_lineWidth);

    self.jq_leftLine.frame = CGRectMake(0, 0, self.jq_lineWidth?self.jq_lineWidth:1, self.height);
    self.jq_btn.frame = CGRectMake(CGRectGetMaxX(self.jq_leftLine.frame), 0, self.width-self.jq_leftLine.width, self.height);
    
}

@end

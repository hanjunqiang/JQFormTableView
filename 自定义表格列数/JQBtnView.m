//
//  JQBtnView.m
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQBtnView.h"
#import "JQFormModel.h"
#import "JQLineButton.h"
@interface JQBtnView()

@property (nonatomic, strong) UILabel *leftLine;

@property (nonatomic, strong) NSMutableArray *btnsArray;
@end

@implementation JQBtnView

-(NSMutableArray *)btnsArray{
    if (_btnsArray == nil) {
        _btnsArray = [NSMutableArray array];
    }
    return _btnsArray;
}


-(void)setModel:(JQFormModel *)model
{
    _model = model;

    /**
        model有数据，并且没有创建过按钮时，走这里的创建方法。
         注意：不能在这里赋值，因为该方法只会走一次，所以，在后面要再写个方法进行赋值。
    */
    if (model.jq_valuesArray.count&&!self.btnsArray.count) {
        
        for (int i = 0; i < model.jq_valuesArray.count; i++) {
            
            JQLineButton *btnView = [[JQLineButton alloc] init];
            [self addSubview:btnView];
            btnView.userInteractionEnabled = YES;
            //作用：关闭长按按钮时的高亮状态
            //            btn.adjustsImageWhenHighlighted = NO;
            btnView.tag = i;
            btnView.jq_lineWidth = self.jq_lineWidth?self.jq_lineWidth:1;   //这里要给JQLineButton的属性赋值，不然按钮左侧线宽改不了。

            btnView.jq_btn.titleLabel.font = [UIFont systemFontOfSize:self.jq_fontSize?self.jq_fontSize:10];
            [btnView.jq_btn setTitleColor:self.jq_fontColor?self.jq_fontColor:[UIColor blackColor] forState:UIControlStateNormal];
            btnView.jq_leftLine.width = self.jq_lineWidth?self.jq_lineWidth:1;
            btnView.jq_leftLine.backgroundColor = self.jq_lineColor?self.jq_lineColor:[UIColor blackColor];

//            [btnView.jq_btn addTarget:self action:@selector(ceshi:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.btnsArray addObject:btnView];
        }
        
    }
    
    //给cell上的按钮进行赋值
    for (int i = 0; i<self.btnsArray.count; i++) {
        
        JQLineButton *btnView = self.btnsArray[i];
        [btnView.jq_btn setTitle:model.jq_valuesArray[i] forState:UIControlStateNormal];
//        [btnView.jq_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        btnView.jq_btn.titleLabel.font = [UIFont systemFontOfSize:self.jq_fontSize?self.jq_fontSize:10];

        btnView.jq_leftLine.backgroundColor = self.jq_lineColor?self.jq_lineColor:[UIColor blackColor];
        btnView.jq_leftLine.width = self.jq_lineWidth?self.jq_lineWidth:1;
    }
    
    [self layoutIfNeeded];  //这里要强制刷新一下，不然lastView.jq_btn.titleLabel.width的值还不准确
    
    //-------------------------计算高度----------------------------------
    CGFloat jq_height = 0;
    for (int i = 0; i < model.jq_valuesArray.count; i++) {
        
        //        NSString *jq_content = [model.jq_valuesArray[i] stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\n"];
        
        NSString *jq_content = model.jq_valuesArray[i];
        //避免英文后跟\n计算高度不对的情况。
        if ([jq_content containsString:@"\n"]) {
            jq_content = [jq_content stringByAppendingString:@"\n"];
        }
        
        JQLineButton *lastView = self.btnsArray.lastObject;
        CGFloat h = [jq_content jq_boundingRectWithSize:CGSizeMake(lastView.jq_btn.titleLabel.width, 0) font:[UIFont systemFontOfSize:self.jq_fontSize?self.jq_fontSize:10] lineSpacing:0].height;
        //计算指定行的高度
        //        CGFloat h = [jq_content jq_boundingRectWithSize:CGSizeMake(SCREEN_WIDTH/model.jq_valuesArray.count, 0) font:[UIFont systemFontOfSize:17] lineSpacing:0 maxLines:2];
        int hh = ceil(h);
        if (jq_height<hh) {
            jq_height = hh;
        }
    }
    
    //防止行高太低不好看的情况,加15。（目前测试2、5列时有问题）
    if (model.jq_valuesArray.count==2||model.jq_valuesArray.count==5) {
        jq_height += 15;
    }
    
    CGFloat lineW = self.jq_lineWidth?self.jq_lineWidth:1; //线宽
    jq_height += lineW;
    
    model.cellHeight = jq_height;
    
//    [self layoutIfNeeded];
}

-(void)setJq_lineWidth:(CGFloat)jq_lineWidth{
    _jq_lineWidth = jq_lineWidth;
    
    //给按钮左侧线设置线宽
    for (int i = 0; i<self.btnsArray.count; i++) {
        
        JQLineButton *btnView = self.btnsArray[i];
        btnView.jq_lineWidth = self.jq_lineWidth?self.jq_lineWidth:1;

    }
    
//    [self.superview.superview.superview layoutIfNeeded];
}

-(void)setJq_lineColor:(UIColor *)jq_lineColor
{
    _jq_lineColor = jq_lineColor;
    
    //给按钮左侧线设置线颜色
    for (int i = 0; i<self.btnsArray.count; i++) {
        
        JQLineButton *btnView = self.btnsArray[i];
        btnView.jq_leftLine.backgroundColor = self.jq_lineColor?self.jq_lineColor:[UIColor blackColor];
    }
    
}

-(void)setJq_fontSize:(CGFloat)jq_fontSize
{
    _jq_fontSize = jq_fontSize;
    
    //给按钮左侧线设置线颜色
    for (int i = 0; i<self.btnsArray.count; i++) {
        
        JQLineButton *btnView = self.btnsArray[i];
        btnView.jq_btn.titleLabel.font = [UIFont systemFontOfSize:jq_fontSize?jq_fontSize:self.jq_fontSize?self.jq_fontSize:10];
        
    }
}

-(void)setJq_fontColor:(UIColor *)jq_fontColor
{
    _jq_fontColor = jq_fontColor;
    
    //给按钮左侧线设置线颜色
    for (int i = 0; i<self.btnsArray.count; i++) {
        
        JQLineButton *btnView = self.btnsArray[i];
        [btnView.jq_btn setTitleColor:self.jq_fontColor?self.jq_fontColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

-(void)ceshi:(UIButton *)btn
{
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    //按钮和内容一一对应时，才更新布局约束。
    if (self.btnsArray.count == self.model.jq_valuesArray.count) {
        [self.btnsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        
        //➤ 这里要控制竖直方向的约束
        [self.btnsArray mas_makeConstraints:^(MASConstraintMaker *make) {
            
            //MASAxisTypeVertical
            make.top.mas_equalTo(@0);
            make.bottom.mas_equalTo(@0);
            
        }];
    }
    
}

@end

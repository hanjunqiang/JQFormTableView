//
//  JQFormCell.m
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQFormCell.h"

@implementation JQFormCell

- (void)awakeFromNib {
    [super awakeFromNib];

/**
    iphone6系统10+时，tableview左侧有分隔线，与每行的cell还对应着（而且还超出了tableview），6p上没问题。
    系统bug，这里移除也没用。
*/
//    for (UIView *view in self.subviews) {
//        NSLog(@"test---%@",[view class]);
//        NSString *viewName = NSStringFromClass([view class]);
//
//        if ([viewName isEqualToString:@"_UITableViewCellSeparatorView"]) {
//            NSLog(@"1111111111111111111");
//            //            view.hidden = YES;
//            [view removeFromSuperview];
//        }
//    }
}

//-(void)setDataArray:(NSMutableArray *)dataArray{
//    _dataArray = dataArray;
//
//    self.jq_btnView.modelsArray = dataArray;
//
//}

-(void)setModel:(JQFormModel *)model
{
    _model = model;
    for (UIView *view in self.subviews) {
        NSLog(@"test---%@",[view class]);
        NSString *viewName = NSStringFromClass([view class]);
        
        if ([viewName isEqualToString:@"_UITableViewCellSeparatorView"]) {
            NSLog(@"1111111111111111111");
            //            view.hidden = YES;
            [view removeFromSuperview];
        }
    }
//    self.jq_btnView.modelsArray = model.jq_valuesArray;
    self.jq_btnView.model = model;
    
//    for (int i = 0; i<self.jq_btnView.subviews.count; i++) {
//
//        NSLog(@"test---%@",self.jq_btnView.subviews);
//
//        if ([self.jq_btnView.subviews[i] isKindOfClass:[UIView class]]) {
//            UIButton *btn = self.jq_btnView.subviews[i];
//
//            if (btn.titleLabel) {
//                NSLog(@"zlkj---%f",CGRectGetMaxY(btn.titleLabel.frame));
//            }
//        }
//    }


    
//    [self layoutIfNeeded];

    
}

-(void)setJq_lineWidth:(CGFloat)jq_lineWidth{
    _jq_lineWidth = jq_lineWidth;
    self.jq_btnView.jq_lineWidth = jq_lineWidth;    //给子控件传递线宽
    
    NSMutableArray *array2 = [@[self.jq_topLineH,self.jq_bottomLineH,self.jq_leftLineH,self.jq_rightLineH] mutableCopy];
    
    for (NSLayoutConstraint *jq_layout in array2) {
        
        jq_layout.constant = self.jq_lineWidth?self.jq_lineWidth:1;
    }
}

-(void)setJq_lineColor:(UIColor *)jq_lineColor{
    _jq_lineColor = jq_lineColor;
    self.jq_btnView.jq_lineColor = jq_lineColor;    //给子控件传递线颜色

    NSMutableArray *array1 = [@[self.jq_topLine,self.jq_bottomLine,self.jq_leftLine,self.jq_rightLine] mutableCopy];
    
    for (UIView *lineView in array1) {
        
        lineView.backgroundColor = self.jq_lineColor?self.jq_lineColor:[UIColor blackColor];
    }
    
}

-(void)setJq_fontSize:(CGFloat)jq_fontSize{
    _jq_fontSize = jq_fontSize;
    
    self.jq_btnView.jq_fontSize = jq_fontSize;  ////给子控件传递文本字体大小
}

-(void)setJq_fontColor:(UIColor *)jq_fontColor{
    _jq_fontColor = jq_fontColor;
    
    self.jq_btnView.jq_fontColor = _jq_fontColor;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        NSLog(@"test---%@",[view class]);
        NSString *viewName = NSStringFromClass([view class]);
        
        if ([viewName isEqualToString:@"_UITableViewCellSeparatorView"]) {
            NSLog(@"1111111111111111111");
//            view.hidden = YES;
            [view removeFromSuperview];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

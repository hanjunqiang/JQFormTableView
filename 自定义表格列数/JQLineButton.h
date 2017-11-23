//
//  JQLineButton.h
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQLineButton : UIView

@property (nonatomic, strong) UILabel *jq_leftLine;
@property (nonatomic, strong) UIButton *jq_btn;


@property (nonatomic, assign) CGFloat jq_lineWidth; //线条宽度
@property (nonatomic, strong) UIColor *jq_lineColor;  //线条颜色
@property (nonatomic, assign) CGFloat jq_fontSize;  //字体大小
@property (nonatomic, strong) UIColor *jq_fontColor; //字体颜色

@end

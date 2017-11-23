//
//  JQFormTableView.h
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQFormTableView : UITableView

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, assign) CGFloat jq_lineWidth; //线条宽度
@property (nonatomic, strong) UIColor *jq_lineColor;  //线条颜色
@property (nonatomic, assign) CGFloat jq_fontSize;  //字体大小
@property (nonatomic, strong) UIColor *jq_fontColor; //字体颜色
@property (nonatomic, strong) UIColor *jq_FormBackgroundColor; //表格背景色

@property (nonatomic, assign) CGFloat jq_tableViewHeight;
@end

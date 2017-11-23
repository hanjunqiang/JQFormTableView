//
//  JQFormCell.h
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JQBtnView.h"
#import "JQFormModel.h"
@interface JQFormCell : UITableViewCell

@property (weak, nonatomic) IBOutlet JQBtnView *jq_btnView;

//@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) JQFormModel *model;

@property (weak, nonatomic) IBOutlet UIView *jq_topLine;
@property (weak, nonatomic) IBOutlet UIView *jq_bottomLine;
@property (weak, nonatomic) IBOutlet UIView *jq_rightLine;
@property (weak, nonatomic) IBOutlet UIView *jq_leftLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jq_topLineH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jq_bottomLineH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jq_rightLineH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jq_leftLineH;

//JQBtnView距离底部的约束（最后一行底部多了一条线，所以要留出该线的间距，按钮的文本才显示到正中间）
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jq_bottomSpace;


@property (nonatomic, assign) CGFloat jq_lineWidth; //线条宽度
@property (nonatomic, strong) UIColor *jq_lineColor;  //线条颜色
@property (nonatomic, assign) CGFloat jq_fontSize;  //字体大小
@property (nonatomic, strong) UIColor *jq_fontColor; //字体颜色
@property (nonatomic, strong) UIColor *jq_FormBackgroundColor; //表格背景色

//@property (nonatomic, assign) NSIndexPath *jq_indexPath;    
@end

//
//  JQFormTableView.m
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQFormTableView.h"
#import "JQFormCell.h"

@interface JQFormTableView()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation JQFormTableView

static  NSString* const  JQFormCellID = @"JQFormCellID";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.showsVerticalScrollIndicator = NO;
//        self.backgroundColor = [UIColor redColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.separatorColor = [UIColor clearColor];
        self.estimatedRowHeight = 100;
//        self.rowHeight = UITableViewAutomaticDimension;

        self.tableFooterView = [UIView new];
        [self registerNib:[UINib nibWithNibName:@"JQFormCell" bundle:nil] forCellReuseIdentifier:JQFormCellID];
    }
    return self;
}


-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JQFormCell *cell = [tableView dequeueReusableCellWithIdentifier:JQFormCellID];
    
    
    JQFormModel *model = self.dataArr[indexPath.row];
    cell.jq_fontSize = self.jq_fontSize;   //model的set方法中计算高度用到了字体大小，所以要放在model前！！！
    cell.jq_fontColor = self.jq_fontColor;
    cell.jq_lineWidth = self.jq_lineWidth;
    cell.jq_lineColor = self.jq_lineColor;
    cell.backgroundColor = self.jq_FormBackgroundColor?self.jq_FormBackgroundColor:[UIColor whiteColor];
    cell.model = model;
    
    if (indexPath.row==self.dataArr.count-1) {
        
        cell.jq_bottomLine.hidden = NO;
    }else{
        cell.jq_bottomLine.hidden = YES;
    }
    
//    NSLog(@"cell.subviews---%@",[cell.subviews[0] class]);
//    NSLog(@"cell.subviews---%@",[cell.subviews[1] class]);

//    for (UIView *view in cell.subviews) {
//        NSLog(@"test---%@",[view class]);
//        NSString *viewName = NSStringFromClass([view class]);
//        
//        if ([viewName isEqualToString:@"_UITableViewCellSeparatorView"]) {
//            NSLog(@"1111111111111111111");
//            view.hidden = YES;
//        }
//    }
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JQFormModel *model = self.dataArr[indexPath.row];
    
    return model.cellHeight;
}

-(CGFloat)jq_tableViewHeight{
    
    NSLog(@"self.contentSize.height---%f",self.contentSize.height);
    [self layoutIfNeeded]; //必须先强制布局一下，不然拿不到高度。
    
    return self.contentSize.height;
    
}






@end

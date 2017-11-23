//
//  JQFormModel.h
//  自定义表格列数
//
//  Created by 韩军强 on 2017/11/22.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JQFormModel : NSObject

@property (nonatomic, strong) NSString *jq_value1;
@property (nonatomic, strong) NSString *jq_value2;
@property (nonatomic, strong) NSString *jq_value3;
@property (nonatomic, strong) NSString *jq_value4;
@property (nonatomic, strong) NSString *jq_value5;
@property (nonatomic, strong) NSString *jq_value6;

@property (nonatomic, strong) NSMutableArray *jq_valuesArray;

@property (nonatomic, assign) CGFloat cellHeight;

@end

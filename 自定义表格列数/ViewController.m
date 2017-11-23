/**
    原理：
        1，一行代表tableview的一个cell。
        2，每行的cell显示顶部的线，判断是否是最后一行，最后一行cell显示底部的线。
        3，每行的cell显示右侧的线。左侧的线其实是自定义的文本按钮（左侧封装的一条线）。
 
     bug1：英文后面不能有\n，计算的文本高度会有问题.
     解决方式，计算文本高度的时候copy一份文本,只要包含\n,那么就在文本结尾拼接一个\n即可。
*/

#import "ViewController.h"
#import "JQFormTableView.h"
#import "JQFormModel.h"

@interface ViewController ()
@property (nonatomic, strong) JQFormTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JQFormTableView *tableView = [[JQFormTableView alloc] initWithFrame:CGRectMake(2, 20, SCREEN_WIDTH-4, SCREEN_HEIGHT-20)];
    tableView.backgroundColor = [UIColor yellowColor];
    self.tableView = tableView;
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        JQFormModel *model = [JQFormModel new];
        if (i==0) {
            model.jq_value1 = @"序号";
            model.jq_value2 = @"农场名称";
            model.jq_value3 = @"存栏";
            model.jq_value4 = @"日龄";
            model.jq_value5 = @"免疫日期";
            model.jq_value6 = @"名称";
        }else{
            model.jq_value1 = [@(i) stringValue];
            model.jq_value2 = @"张三";
            model.jq_value3 = @"400";
            model.jq_value4 = @"40";
            model.jq_value5 = @"2017-11-22";
            model.jq_value6 = @"猪瘟";
        }

        /**
             这里需要把所有的模型属性（即所有显示的文本），放在数组中。
             因为：展示的时候是一行一行循环赋值的。
        */
        NSMutableArray *array = [@[model.jq_value1,model.jq_value2,model.jq_value3,model.jq_value4,model.jq_value5,model.jq_value6] mutableCopy];
        model.jq_valuesArray = array;
        
        [dataArray addObject:model];
    }
    
//测试自定义表格属性
//    tableView.jq_lineWidth = 1;
//    tableView.jq_lineColor = [UIColor whiteColor];
//    tableView.jq_fontSize = 10;
//    tableView.jq_fontColor = [UIColor whiteColor];
//    tableView.jq_FormBackgroundColor = [UIColor blackColor];
    
    tableView.dataArr = dataArray;
    [self.view addSubview:tableView];
    
    tableView.height = tableView.jq_tableViewHeight; //更新tableview高度
    
    
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    testBtn.backgroundColor = [UIColor redColor];
    
    [testBtn addTarget:self action:@selector(jq_clickBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    
}

-(void)jq_clickBtnMethod
{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

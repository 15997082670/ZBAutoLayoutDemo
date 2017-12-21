//
//  ViewController.m
//  ZBAutoLayoutDemo
//
//  Created by 张斌斌 on 2017/12/18.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "ZBTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView                *tableView;
@property(strong,nonatomic)NSMutableArray<NSDictionary*> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource=[NSMutableArray array];
    [self loadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)loadData{
    [_dataSource addObject:@{@"height":@"100"}];
    [_dataSource addObject:@{@"height":@"80"}];
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"1" ofType:@"txt"];
    
    NSData*data=[NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    [_dataSource addObject:dataDic];
    [_dataSource addObject:@{@"height":@"100"}];
    [_dataSource addObject:@{@"height":@"80"}];
    
    {
        NSString *filePath=[[NSBundle mainBundle] pathForResource:@"3" ofType:@"txt"];
        
        NSData*data=[NSData dataWithContentsOfFile:filePath];
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        [_dataSource addObject:dataDic];
    }
     [_dataSource addObject:@{@"height":@"80"}];
     [_dataSource addObject:@{@"height":@"80"}];

    [self.view addSubview:self.tableView];
    
}
#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataSource[indexPath.row][@"height"] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ZBTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    [cell creteViewForDictionary:_dataSource[indexPath.row]];
    return cell;
}


- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}
@end

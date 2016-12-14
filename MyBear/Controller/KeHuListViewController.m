//
//  KeHuListViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KeHuListViewController.h"
#import "addKeHuViewController.h"
@interface KeHuListViewController ()

@end

@implementation KeHuListViewController{
    NSMutableArray *indexArr;
}
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;
@synthesize isChaKan;

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    indexArr=[[NSMutableArray alloc]init];
    NSArray *arr = [LUserDefault objectForKey:kehuKey];
  NSMutableArray * adataSource=[[NSMutableArray alloc]init];
    if (arr) {
        [adataSource addObjectsFromArray:arr];
    }
    dataSource=[[NSMutableArray alloc]init];
    if (isChaKan) {
        for (int i=0; i<adataSource.count; i++) {
            NSDictionary *dic=[adataSource objectAtIndex:i];
            NSDictionary *adic = [dic objectForKey:kehuDuiJieYeWuYuan];
            if ([[adic validStringForKey:yeWuYuanGongHao]isEqualToString:LUserInor(yeWuYuanGongHao)]) {
                [dataSource addObject:dic];
                [indexArr addObject:LString(i)];
            }
        }

    }else{
        [dataSource addObjectsFromArray:adataSource];
    }
    [myTableView reloadData];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"客户";
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight-44)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //myTableView.estimatedRowHeight = 1000;
    
    //myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [myTableView setTableFooterView:[[UIView alloc]init]];
    
    [self.view addSubview:myTableView];
    
    
    [self setNavRightButtonTitle:@"添加" selector:@selector(tNavRightButtonClick)];


}

- (void)tNavRightButtonClick{
    addKeHuViewController *viewController = [[addKeHuViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

}

#pragma mark ========================================
#pragma mark ==UITableView
#pragma mark ========================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier01=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier01];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier01];
    }
    cell.textLabel.text=dataSource[indexPath.row][kehuName];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (isChaKan) {
        NSDictionary *dic=dataSource[indexPath.row];
        
        addKeHuViewController *viewController = [[addKeHuViewController alloc]init];
        viewController.dataDic=dic;
        viewController.nowIndex=[[indexArr objectAtIndex:indexPath.row] integerValue];
        [self.navigationController pushViewController:viewController animated:YES];

    }else{
        NSDictionary *dic=dataSource[indexPath.row];
        
        addKeHuViewController *viewController = [[addKeHuViewController alloc]init];
        viewController.dataDic=dic;
        viewController.nowIndex=indexPath.row;
        [self.navigationController pushViewController:viewController animated:YES];

    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

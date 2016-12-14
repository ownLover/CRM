//
//  kehudigndanViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "kehudigndanViewController.h"

@interface kehudigndanViewController ()

@end

@implementation kehudigndanViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;

@synthesize isFromYeWu;
@synthesize isFromLingDao;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dataSource=[[NSMutableArray alloc]init];

   NSArray *arr = [LUserDefault objectForKey:kehuKey];
    
    if (isFromYeWu) {
        for ( int i=0; i<arr.count; i++) {
            NSDictionary *dic=arr[i];
            if ([[[dic objectForKey:kehuDuiJieYeWuYuan] objectForKey:yeWuYuanName] isEqualToString:LUserInor(yeWuYuanName)]) {
                if ([dic objectForKey:kehudingdan]) {
                    [dataSource addObjectsFromArray:[dic objectForKey:kehudingdan]];
                    
                }
            }
        }

    }else if(isFromLingDao){
        for ( int i=0; i<arr.count; i++) {
            NSDictionary *dic=arr[i];
            if ([dic objectForKey:kehudingdan]) {
                [dataSource addObjectsFromArray:[dic objectForKey:kehudingdan]];
                
            }
        }

    }else{
        for ( int i=0; i<arr.count; i++) {
            NSDictionary *dic=arr[i];
            if ([[dic objectForKey:kehuName] isEqualToString:LUserInor(kehuName)]) {
                if ([dic objectForKey:kehudingdan]) {
                    [dataSource addObjectsFromArray:[dic objectForKey:kehudingdan]];
                    
                }
            }
        }

        }
    
    
    [myTableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight-44)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //myTableView.estimatedRowHeight = 1000;
    
    //myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [myTableView setTableFooterView:[[UIView alloc]init]];
    
    [self.view addSubview:myTableView];

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
//    @{kehudingdanShangPing:dataDic,kehudingdanshuliang:_tf1.text,kehudingdanshijian:_btn1.titleLabel.text}
    NSDictionary *dic=dataSource[indexPath.row];
    cell.textLabel.text=[[dic objectForKey:kehudingdanShangPing] objectForKey:shangPingName];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

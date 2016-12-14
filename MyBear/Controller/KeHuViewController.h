//
//  KeHuViewController.h
//  MyBear
//
//  Created by 林立祥 on 2016/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface KeHuViewController : BaseViewController
<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *myTableView;
@property(nonatomic,retain)NSMutableArray *dataSource;
@property(nonatomic,retain)NSMutableDictionary *information;
@end

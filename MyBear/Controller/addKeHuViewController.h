//
//  addKeHuViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface addKeHuViewController : BaseViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *sexTf;
@property (weak, nonatomic) IBOutlet UITextField *zhiwuTf;
@property (weak, nonatomic) IBOutlet UITextField *lianxiTf;
@property (weak, nonatomic) IBOutlet UITextField *youjianTf;


@property(nonatomic,retain)NSDictionary *dataDic;
@property(nonatomic,assign)NSInteger nowIndex;
@property (weak, nonatomic) IBOutlet UIButton *dingDanzhuangtaiBtn;

@property (weak, nonatomic) IBOutlet UIButton *duijieYewuyuanBtn;

@property(nonatomic,assign)BOOL isFromKeHu;
@end

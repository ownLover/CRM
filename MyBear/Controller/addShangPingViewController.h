//
//  addShangPingViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"
#import "KKDatePickerView.h"
@interface addShangPingViewController : BaseViewController<KKAlbumPickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,KKDatePickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *priceTf;
@property (weak, nonatomic) IBOutlet UITextField *numTf;
@property (weak, nonatomic) IBOutlet UITextField *shangXianTf;
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;


@property(nonatomic,retain)NSDictionary *dataDic;
@property(nonatomic,assign)NSInteger nowIndex;


@property(nonatomic,assign)BOOL isFromKehu;



@property (weak, nonatomic) IBOutlet UILabel *lab;

@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end

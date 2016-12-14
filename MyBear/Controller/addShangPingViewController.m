//
//  addShangPingViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "addShangPingViewController.h"

@interface addShangPingViewController ()

@end

@implementation addShangPingViewController{
    NSString *tempImgPath;
}
@synthesize dataDic;
@synthesize nowIndex;

@synthesize isFromKehu;

- (void)NavRightButtonClick{
    if ([_nameTf.text isEqualToString:@""]||[_priceTf.text isEqualToString:@""]||[_numTf.text isEqualToString:@""]||[_shangXianTf.text isEqualToString:@""]||!tempImgPath) {
        KKShowNoticeMessage(@"请完善消息");
        return;
    }
    
    NSArray *arr = [LUserDefault objectForKey:shangPingKey];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr) {
        [array addObjectsFromArray:arr];
    }
    
    if (dataDic) {
        [array replaceObjectAtIndex:nowIndex withObject:@{shangPingName:_nameTf.text,shangPingJiaGe:_priceTf.text,shangPingNum:_numTf.text,shangPingShangXiang:_shangXianTf.text,shangPingImg:tempImgPath}];
        KKShowNoticeMessage(@"修改成功");

    }else{
        [array addObject:@{shangPingName:_nameTf.text,shangPingJiaGe:_priceTf.text,shangPingNum:_numTf.text,shangPingShangXiang:_shangXianTf.text,shangPingImg:tempImgPath}];
        KKShowNoticeMessage(@"添加成功");

        
    }
    
    [LUserDefault setObject:array forKey:shangPingKey];
    
  
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"商品";
    
    _lab.hidden=YES;
    _lab1.hidden=YES;
    _tf1.hidden=YES;
    _btn1.hidden=YES;
    
    if (dataDic) {
        _nameTf.text=[dataDic validStringForKey:shangPingName];
        _priceTf.text=[dataDic validStringForKey:shangPingJiaGe];
        _numTf.text=[dataDic validStringForKey:shangPingNum];
        _shangXianTf.text=[dataDic validStringForKey:shangPingShangXiang];
        [_imgBtn setImage:[[UIImage alloc]initWithContentsOfFile:[dataDic validStringForKey:shangPingImg]] forState:UIControlStateNormal];;
        [self setNavRightButtonTitle:@"修改" selector:@selector(NavRightButtonClick)];

    }else{
        [self setNavRightButtonTitle:@"添加" selector:@selector(NavRightButtonClick)];

    }
    
    if (isFromKehu) {
        [self setNavRightButtonTitle:@"订购" selector:@selector(dinggou)];
        _lab.hidden=NO;
        _lab1.hidden=NO;
        _tf1.hidden=NO;
        _btn1.hidden=NO;

    }
}

- (void)dinggou{
    NSArray *arr=[LUserDefault objectForKey:kehuKey];
    NSMutableArray *bigArr=[[NSMutableArray alloc]initWithArray:arr];

    NSMutableDictionary *tDic=[[NSMutableDictionary alloc]init];;
    NSInteger index=0;
    for (int i=0; i<arr.count; i++) {
        NSDictionary *dic=arr[i];
        if ([LUserInor(kehuName) isEqualToString:[dic validStringForKey:kehuName]]) {
            tDic=[[NSMutableDictionary alloc]initWithDictionary:dic];;
            index=i;
        }
    }
    
    NSArray *arr1=[tDic objectForKey:kehudingdan];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr1) {
        [array addObjectsFromArray:arr1];
    }
    [array addObject:@{kehudingdanShangPing:dataDic,kehudingdanshuliang:_tf1.text,kehudingdanshijian:_btn1.titleLabel.text}];
    [tDic setObject:array forKey:kehudingdan];

    [bigArr replaceObjectAtIndex:index withObject:tDic];
    [LUserDefault setObject:bigArr forKey:kehuKey];
    KKShowNoticeMessage(@"订购成功");
    [self.navigationController popViewControllerAnimated:YES];

}
- (IBAction)xuanzheshijan:(id)sender {
    
    [KKDatePickerView showWithDelegate:self
                        datePickerMode:UIDatePickerModeDateAndTime
                               minDate:[NSDate date]
                               maxDate:nil
                              showDate:[NSDate date]
                         identifierKey:@"时间"];

}

#pragma mark ========================================
#pragma mark == 【日期】
#pragma mark ========================================
- (void)KKDatePickerView:(KKDatePickerView*)datePickerView didFinishedWithDate:(NSDate *)aDate identifierKey:(NSString*)aIdentifierKey{
    [_btn1 setTitle:[NSDate getStringFromDate:aDate dateFormatter:KKDateFormatter02] forState:UIControlStateNormal];
    

}


- (IBAction)imgClick:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"拍照"
                                  otherButtonTitles:@"相册",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag=3000;
    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag==3000) {
        if (buttonIndex == 0) {
            UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.allowsEditing = YES;
            imagePickerController.delegate = self;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
        else if (buttonIndex == 1) {
            NSLog(@"1");
            KKAlbumPickerController * viewController = [[KKAlbumPickerController alloc]
                                                        initWithDelegate:self
                                                        numberNeedSelected:1
                                                        editEnable:YES
                                                        cropSize:CGSizeMake(200, 200)
                                                        pushToDefaultDirectory:YES];
            
            [self presentViewController:viewController animated:YES completion:^{
            }];
        }
    }
}

#pragma mark ==================================================
#pragma mark == KKAlbumPickerControllerDelegate【图片】
#pragma mark ==================================================
- (void)KKAlbumPickerController_DidFinishedPickImage:(NSArray*)aImageArray imageInformation:(NSArray*)aImageInformationAray
{
    if ([aImageArray count]>0) {
        [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
        
        [NSData convertImage:aImageArray toDataSize:200 convertImageOneCompleted:^(NSData *imageData, NSInteger index) {
            
            
            
            NSString *path = [NSString stringWithFormat:@"%@/Documents/PublishFinanceImage_header%@.jpg", NSHomeDirectory(),[NSDate getStringFromDate:[NSDate date] dateFormatter:KKDateFormatter01]];
            tempImgPath=path;
            BOOL result = [imageData writeToFile:path atomically:YES];
            if (result) {
                [_imgBtn setImage:[[UIImage alloc]initWithContentsOfFile:tempImgPath] forState:UIControlStateNormal];

            }
        } KKImageConvertImageAllCompletedBlock:^{
            [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
        }];
    }
}


#pragma mark ========================================
#pragma mark ==UIImagePickerController
#pragma mark ========================================
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSArray *arr=[NSArray arrayWithObjects:image, nil];
    [NSData convertImage:arr toDataSize:200 convertImageOneCompleted:^(NSData *imageData, NSInteger index) {
        NSString *path = [NSString stringWithFormat:@"%@/Documents/PublishFinanceImage_header%@.jpg", NSHomeDirectory(),[NSDate getStringFromDate:[NSDate date] dateFormatter:KKDateFormatter01]];
        tempImgPath=path;
        
        BOOL result = [imageData writeToFile:path atomically:YES];
        if (result) {
            ;
            [_imgBtn setImage:[[UIImage alloc]initWithContentsOfFile:tempImgPath] forState:UIControlStateNormal];
            
        }
        
    } KKImageConvertImageAllCompletedBlock:^{
        [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
    }];
}



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

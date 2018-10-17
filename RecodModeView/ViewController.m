//
//  ViewController.m
//  RecodModeView
//
//  Created by 吕晴阳 on 2018/10/17.
//  Copyright © 2018 Lv Qingyang. All rights reserved.
//

#import "ViewController.h"
#import "LandScapePicker.h"

@interface ViewController ()<LandScapePickerDelegate>
@property (weak, nonatomic) IBOutlet LandScapePicker *recordModeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.recordModeView.titles = @[[self recordModeStr:ECRecordModeTakePhoto], [self recordModeStr:ECRecordModeClick], [self recordModeStr:ECRecordModeLongPress]];
    self.recordModeView.textColor = [UIColor whiteColor];
    self.recordModeView.delegate = self;
    [self.recordModeView selectAtIndex:1 animated:NO];
}

#pragma mark -- Record mode

- (NSString *)recordModeStr:(ECRecordMode)mode {
    switch (mode) {
        case ECRecordModeTakePhoto:
            return @"拍照";
        case ECRecordModeClick:
            return @"单击拍";
        case ECRecordModeLongPress:
            return @"长按拍";
        default:
            return @"unknown";
    }
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

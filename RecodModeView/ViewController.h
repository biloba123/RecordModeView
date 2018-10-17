//
//  ViewController.h
//  RecodModeView
//
//  Created by 吕晴阳 on 2018/10/17.
//  Copyright © 2018 Lv Qingyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    ECRecordModeTakePhoto = 0,
    ECRecordModeClick,
    ECRecordModeLongPress,
} ECRecordMode;
@interface ViewController : UIViewController

@end

NS_ASSUME_NONNULL_END

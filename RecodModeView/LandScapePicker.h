//
// Created by 吕晴阳 on 2018/10/11.
// Copyright (c) 2018 Lv Qingyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LandScapePickerDelegate
@optional
- (void)pickerView:(UIPickerView *)pickerView didSelectAtIndex:(NSInteger)index;
@end

@interface LandScapePicker : UIView
@property(nonatomic, copy) NSArray<NSString *> *titles;
@property(nonatomic) UIColor *textColor;
@property(nonatomic) UIFont *font;
@property(nonatomic, weak) id <LandScapePickerDelegate> delegate;

-(void)selectAtIndex:(NSInteger)index animated:(BOOL)animated;
@end
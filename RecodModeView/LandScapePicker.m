//
// Created by 吕晴阳 on 2018/10/11.
// Copyright (c) 2018 Lv Qingyang. All rights reserved.
//

#import "LandScapePicker.h"

@interface LandScapePicker () <UIPickerViewDataSource, UIPickerViewDelegate>
@property(nonatomic) UIPickerView *pickerView;
@end

@implementation LandScapePicker {

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];

        CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.pickerView = [[UIPickerView alloc] initWithFrame:rect];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.transform = CGAffineTransformMakeRotation(M_PI * 3 / 2);
        //旋转后frame有变，需要重新设置
        self.pickerView.frame = rect;

        [self addSubview:self.pickerView];
    }

    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGFloat centerX = (rect.origin.x + rect.size.width) / 2;
    CGFloat bottomY = rect.origin.y + rect.size.height;
    CGFloat y = bottomY - (rect.size.height - self.font.pointSize) / 2 / 2;
    CGRect potRect = CGRectMake(centerX - 2, y - 2, 4, 4);
    [[self.textColor colorWithAlphaComponent:0.8] setFill];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, potRect);
    //CGContextSetFillColor在white和black下有问题，所以改用UIColor的setFill
//    CGContextSetFillColor(context, CGColorGetComponents([self.textColor CGColor]));
    CGContextFillPath(context);
}

#pragma mark -- UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.titles.count;
}

#pragma mark -- UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    //hide the selection indicator
    self.pickerView.subviews[1].hidden = YES;
    self.pickerView.subviews[2].hidden = YES;

    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.titles[row];
    label.font = self.font;
    label.textColor = self.textColor;
    label.transform = CGAffineTransformMakeRotation(M_PI_2);

    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 24;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 64;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self.delegate pickerView:pickerView didSelectAtIndex:row];
}

#pragma mark -- Setter

- (void)setPickerView:(UIPickerView *)pickerView {
    _pickerView = pickerView;
    [self.pickerView reloadAllComponents];
}

- (UIFont *)font {
    if (!_font) {
        _font = [UIFont boldSystemFontOfSize:15];
    }
    return _font;
}

- (void)selectAtIndex:(NSInteger)index animated:(BOOL)animated {
    [self.pickerView selectRow:index inComponent:0 animated:animated];
}


@end
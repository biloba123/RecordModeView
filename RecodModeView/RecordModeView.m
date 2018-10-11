//
// Created by 吕晴阳 on 2018/10/11.
// Copyright (c) 2018 Lv Qingyang. All rights reserved.
//

#import "RecordModeView.h"

static const CGFloat DefaultSpace=10;

@interface RecordModeView ()
@property(nonatomic) NSDictionary<NSAttributedStringKey, id> *textAttrs;
@end

@implementation RecordModeView {

}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor grayColor];
    }

    return self;
}

- (void)setModes:(NSArray<NSString *> *)modes {
    for(UIView *view in self.subviews){
        [view removeFromSuperview];
    }

    [self configFrame];
}

- (void)configView {
    CGRect frame = self.frame;

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setPagingEnabled:YES];
    scrollView.contentSize = CGSizeMake(frame.size.width * self.modes.count, frame.size.height);

    for (int i = 0; i < self.modes.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:
                CGRectMake(frame.origin.x + frame.size.width * i, frame.origin.y, frame.size.width, frame.size.height)];
        label.text = self.modes[i];
        label.font = self.textAttrs[NSFontAttributeName];
        [scrollView addSubview:label];
    }

    [self addSubview:scrollView];
}

- (void)configFrame {
    NSString *longestText = @"";
    for (NSString *mode in self.modes) {
        if (mode.length > longestText.length) {
            longestText = mode;
        }
    }

    CGSize textSize = [longestText sizeWithAttributes:self.textAttrs];
    CGRect rect = self.frame;
    rect.size = textSize;
    self.frame = rect;
}

- (NSDictionary<NSAttributedStringKey, id> *)textAttrs {
    return @{
            NSFontAttributeName: [UIFont systemFontOfSize:60],
    };
}

@end
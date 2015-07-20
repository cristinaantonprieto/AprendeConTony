//
//  JBChartFooterView.m
//  JBChartViewDemo
//
//  Created by Terry Worona on 11/6/13.
//  Copyright (c) 2013 Jawbone. All rights reserved.
//

#import "JBBarChartFooterView.h"

// Numerics
CGFloat const kJBBarChartFooterPolygonViewDefaultPadding = 4.0f;

// Colors
static UIColor *kJBBarChartFooterViewDefaultBackgroundColor = nil;

@interface JBBarChartFooterView ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation JBBarChartFooterView

#pragma mark - Alloc/Init

+ (void)initialize
{
	if (self == [JBBarChartFooterView class])
	{
		kJBBarChartFooterViewDefaultBackgroundColor = [UIColor clearColor];
	}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = kJBBarChartFooterViewDefaultBackgroundColor;
        
        _padding = kJBBarChartFooterPolygonViewDefaultPadding;
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.adjustsFontSizeToFitWidth = NO;
        [_leftLabel setFont:[UIFont systemFontOfSize: 13]];
     //   _leftLabel.font = kJBFontFooterLabel;
        //_leftLabel.textAlignment = NSTextAlignmentLeft;
        _leftLabel.shadowColor = [UIColor clearColor];
        _leftLabel.shadowOffset = CGSizeMake(0, 1);
        _leftLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_leftLabel];

    }
    return self;
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat xOffset = self.padding;
    CGFloat yOffset = 0;
    CGFloat width = ceil(self.bounds.size.width * 0.5) - self.padding;
    
    self.leftLabel.frame = CGRectMake(xOffset, yOffset, 800-25, self.bounds.size.height);
  
}

@end

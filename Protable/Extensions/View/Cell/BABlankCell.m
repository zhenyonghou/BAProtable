//
//  RRSpring
//
//  Created by houzhenyong on 13-7-25.
//  Copyright (c) 2013年 houzhenyong. All rights reserved.
//

#import "BABlankCell.h"

#define kAccessoryViewRightMargin   10
#define kAccessoryViewLeftSpacing   5

@implementation BASeparatorLineVew

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

@end

#pragma mark-
#pragma mark- BABlankCell

@implementation BABlankCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _separatorLineLeftMargin = 15.f;
        _bottomSeparatorLine = [[BASeparatorLineVew alloc] initWithFrame:CGRectZero];

        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        self.backgroundView = _backgroundImageView;

        _accessoryImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

- (void)setCellPositionType:(BACustomCellPositionType)cellPositionType
{
    _cellPositionType = cellPositionType;
    
    if (kCustomCellPositionTypeTail == cellPositionType
        || kCustomCellPositionTypeOnlyOne == cellPositionType) {
        self.showBottomSeparatorLine = NO;
    } else {
        self.showBottomSeparatorLine = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

//    // background image
//    if (self.backgroundImageView.image && [self.backgroundView isEqual:self.backgroundImageView]) {
//        self.backgroundView = _backgroundImageView;
//    }
    
    // separator line
    self.bottomSeparatorLine.frame = CGRectMake(_separatorLineLeftMargin,
                                                self.frame.size.height - 1, self.frame.size.width, 0.5);
    
    self.bottomSeparatorLine.backgroundColor = SKIN_COLOR(@"color_cell_separator");

    // accessory image view
    if (self.accessoryImageView.image) {
        CGSize imageSize = self.accessoryImageView.image.size;
        self.accessoryImageView.frame = CGRectMake(self.width - kAccessoryViewRightMargin - imageSize.width - kAccessoryViewLeftSpacing,
                                                   (self.height - imageSize.height)/2,
                                                   imageSize.width,
                                                   imageSize.height);
        [self addSubview:self.accessoryImageView];
        self.textLabel.width = (self.accessoryImageView.left - kAccessoryViewLeftSpacing) - self.textLabel.left;
    } else {
        [self.accessoryImageView removeFromSuperview];
        self.textLabel.width = self.right - self.textLabel.left;
    }
}

- (void)setShowBottomSeparatorLine:(BOOL)showBottomSeparatorLine
{
    if (showBottomSeparatorLine) {
        [self addSubview:_bottomSeparatorLine];
    } else {
        [_bottomSeparatorLine removeFromSuperview];
    }
    _bottomSeparatorLine.hidden = !showBottomSeparatorLine;
}

@end



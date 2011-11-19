//
//  KKCoreTextLabel.h
//  KKCoreTextUtils
//
//  Created by Kolin Krewinkel on 11.18.11.
//  Copyright (c) 2011 Kolin Krewinkel. All rights reserved.
//


@interface KKCoreTextLabel : UIView

#pragma mark - Properties

@property (nonatomic) CGFontRef font;
@property (nonatomic, copy) NSAttributedString *text;

#pragma mark - Getters

- (CGSize)suggestedSizeForRange:(NSRange)range constraints:(CGSize)constraints fitRange:(NSRange)fitRange;

@end

//
//  KKCoreTextLabel.m
//  KKCoreTextUtils
//
//  Created by Kolin Krewinkel on 11.18.11.
//  Copyright (c) 2011 Kolin Krewinkel. All rights reserved.
//

#import "KKCoreTextLabel.h"
#import <UIKit/UIKit.h>

@interface KKCoreTextLabel () {
    CTFramesetterRef _framesetter;
    CTFrameRef _frameRef;
}

@end

@implementation KKCoreTextLabel
@synthesize font = _font;
@synthesize text = _text;

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] setFill];
    CTFrameDraw(_frameRef, context);
}

#pragma mark - Setters

- (void)setFrame:(CGRect)frame
{
    CGSize oldSize = self.frame.size;
    [super setFrame:frame];
    if (!CGSizeEqualToSize(oldSize, frame.size)) {
        if (_frameRef)
            CFRelease(_frameRef);
        
        _frameRef = CTFramesetterCreateFrame(_framesetter, CFRangeMake(0, 0), [UIBezierPath bezierPathWithRect:self.bounds].CGPath, NULL);
    }
}

- (void)setText:(NSAttributedString *)text
{
    _text = [text copy];
    if (_framesetter)
        CFRelease(_framesetter);
    
    _framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)_text);
}

#pragma mark - Getters

- (CGSize)suggestedSizeForRange:(NSRange)range constraints:(CGSize)constraints fitRange:(NSRange)fitRange
{
    if (!_framesetter)
        return CGSizeZero;
    
    CFRange bridgeRange = CFRangeMake(0, 0);
    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(_framesetter, CFRangeMake(range.location, range.length), NULL, constraints, &bridgeRange);
    fitRange = NSMakeRange(bridgeRange.location, bridgeRange.length);
    
    return size;
}

@end

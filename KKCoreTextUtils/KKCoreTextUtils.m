//
//  KKCoreTextUtils.m
//  KKCoreTextUtils
//
//  Created by Kolin Krewinkel on 11.17.11.
//  Copyright (c) 2011 Kolin Krewinkel. All rights reserved.
//

#import "KKCoreTextUtils.h"

@implementation KKCoreTextUtils

+ (CGFontRef)fontAtURL:(NSURL *)URL
{
    CGDataProviderRef dataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)URL);
    CGFontRef original = CGFontCreateWithDataProvider(dataProvider);
    CFRelease(dataProvider);

    return original;
}

@end

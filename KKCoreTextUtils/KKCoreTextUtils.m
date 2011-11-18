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
    CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (__bridge CFStringRef)[URL absoluteString], kCFURLPOSIXPathStyle, false);
    CGDataProviderRef dataProvider = CGDataProviderCreateWithURL(url);
    CGFontRef original = CGFontCreateWithDataProvider(dataProvider);
    
    CFRelease(dataProvider);
    CFRelease(url);

    return original;
}

@end

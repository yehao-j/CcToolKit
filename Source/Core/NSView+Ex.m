//
//  NSObject+Cc.m
//  Translate
//
//  Created by yehao on 2023/6/2.
//

#import "NSView+Ex.h"
#import <objc/runtime.h>

@implementation NSView (Ex)

- (BOOL)containBackgroundColor {
    objc_property_t property = class_getProperty([self class], [@"backgroundColor" UTF8String]);
    
    [self performSelector:@selector(backgroundColor)];
    return property != NULL;
}

- (NSColor *)backColor {
    if ([self containBackgroundColor]) {
        return [self performSelector:@selector(backgroundColor)];
    } else {
        if (self.layer.backgroundColor) {
            return [NSColor colorWithCGColor:self.layer.backgroundColor];
        }
        return nil;
    }
}

- (void)setBackColor:(NSColor *)backColor {
    if ([self containBackgroundColor]) {
        [self performSelector:@selector(setBackgroundColor:) withObject:backColor];
    } else {
        self.wantsLayer = YES;
        self.layer.backgroundColor = backColor.CGColor;
    }
}

@end

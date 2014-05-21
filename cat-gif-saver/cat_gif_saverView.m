//
//  cat_gif_saverView.m
//  cat-gif-saver
//
//  Created by George Crabtree on 21/05/2014.
//  Copyright (c) 2014 George Crabtree. All rights reserved.
//  http://giphy.com/embed/7z2oyDXIMEs8w

#import "cat_gif_saverView.h"

@implementation cat_gif_saverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    NSURL *url = [NSURL URLWithString:@"http://giphy.com/embed/7z2oyDXIMEs8w"];
    image = [[NSImage alloc] initWithContentsOfURL:url];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    NSRect imageRect;
    imageRect.origin = NSZeroPoint;
    imageRect.size = [image size];
    NSRect drawingRect = imageRect;
    [image drawInRect:drawingRect fromRect:imageRect operation:NSCompositeSourceOver fraction:1];
    [image drawInRect:rect];
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end

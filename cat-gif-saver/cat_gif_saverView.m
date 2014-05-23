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
    NSURL *url = [NSURL URLWithString:@"http://media0.giphy.com/media/QBtzAnMFO5i9O/giphy.gif"];
    image = [[NSImage alloc] initWithContentsOfURL:url];
    NSSize newSize = [self bounds].size;
    [image setSize:newSize];
    imageView = [[NSImageView alloc] initWithFrame:[self bounds]];
    [imageView setImage:image];
    [imageView setAnimates:true];
    [self addSubview:imageView];
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
   [super drawRect:rect];
}

- (void)animateOneFrame
{
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

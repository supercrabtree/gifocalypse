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
        [self setAnimationTimeInterval:10];
    }
    imageView = [[NSImageView alloc] initWithFrame:[self bounds]];
    fullscreen = [self bounds].size;
    
    [imageView setAnimates:true];
    [self addSubview:imageView];
    return self;
}

- (void)changeImage
{
    NSURL *url;
    if (drand48() < 0.5) {
        url = [NSURL URLWithString:@"http://media0.giphy.com/media/7z2oyDXIMEs8w/giphy.gif"];
    } else  {
        url = [NSURL URLWithString:@"http://media0.giphy.com/media/QBtzAnMFO5i9O/giphy.gif"];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSImage *newImage = [[NSImage alloc] initWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [newImage setSize:fullscreen];
            [imageView setImage:newImage];
        });
    });
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
    [self changeImage];
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

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
    NSLog(@"George");
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    NSURL *imageURL = [NSURL URLWithString:@"http://giphy.com/embed/7z2oyDXIMEs8w"];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:imageURL];
    NSLog(@"size %f %f",image.size.width, image.size.height);
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
//    [super drawRect:rect];
}

- (void)animateOneFrame
{
//    NSImage *image;
//    NSRect myRect;
//    NSSize mySize;
//    
//    image = [[NSImage imageNamed:@"mypict.jpg"] copy];
//    
//    mySize = [image size];
//    
//    myRect.origin.x = 0;
//    myRect.origin.y = 0;
//    myRect.size = mySize;
//    
//    [image lockFocus];
//    [image drawInRect:[self bounds] fromRect:myRect
//            operation:NSCompositeCopy fraction:0.5];
//    [image unlockFocus];
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

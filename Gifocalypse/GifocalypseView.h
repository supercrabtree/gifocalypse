//
//  GifocalypseView.h
//  Gifocalypse
//
//  Created by George Crabtree on 26/05/2014.
//  Copyright (c) 2014 George Crabtree. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface GifocalypseView : ScreenSaverView
{
    NSImage *image;
    NSImageView *imageView;
    NSSize fullscreen;
    NSMutableData *_responseData;
    NSArray *gifURLs;
    IBOutlet id configSheet;
}

@end

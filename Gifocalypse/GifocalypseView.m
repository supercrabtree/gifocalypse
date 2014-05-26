//
//  GifocalypseView.m
//  Gifocalypse
//
//  Created by George Crabtree on 26/05/2014.
//  Copyright (c) 2014 George Crabtree. All rights reserved.
//

#import "GifocalypseView.h"

@implementation GifocalypseView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        //        NSString *giphyURL = @"http://api.giphy.com/v1/gifs/search?q=funny&limit=100&api_key=dc6zaTOxFJmzC";
        NSString *giphyURL = @"http://api.giphy.com/v1/gifs/trending?limit=100&api_key=dc6zaTOxFJmzC";
        NSData *resp = [self makeRestAPICall: giphyURL];
        gifURLs = [self extractGIFURLs:resp];
        imageView = [[NSImageView alloc] initWithFrame:[self bounds]];
        fullscreen = [self bounds].size;
        
        [imageView setAnimates:true];
        [self addSubview:imageView];
        [self setAnimationTimeInterval:6];
    }
    return self;
}

- (void)changeImage
{
    NSURL *url = [NSURL URLWithString:[self getRandomGIFURL:gifURLs]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSImage *newImage = [[NSImage alloc] initWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [newImage setSize:fullscreen];
            [imageView setImage:newImage];
        });
    });
}

-(NSString*) getRandomGIFURL:(NSArray *) urls
{
    return [urls objectAtIndex:arc4random() % [urls count]];
}
-(NSMutableArray*) extractGIFURLs:(NSData *)response
{
    NSMutableArray* urls = [NSMutableArray array];
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    
    NSArray* data = [json objectForKey:@"data"];
    
    for(NSDictionary *item in data) {
        [urls addObject:item[@"images"][@"original"][@"url"]];
    }
    return urls;
}

-(NSData*) makeRestAPICall : (NSString*) reqURLStr
{
    NSURLRequest *Request = [NSURLRequest requestWithURL:[NSURL URLWithString: reqURLStr]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest: Request returningResponse: &resp error: &error];
    return response;
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
    return configSheet;
}

@end

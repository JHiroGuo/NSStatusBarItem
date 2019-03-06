//
//  JHGlobalver.m
//  CStatusBar
//
//  Created by GJH on 2019/3/6.
//  Copyright © 2019 GJH. All rights reserved.
//

#import "JHGlobalver.h"
static JHGlobalver *sharedSingleton = nil;

@interface JHGlobalver()

@property(nonatomic,strong)NSString *defaultImgName;
@property(nonatomic,strong)NSString *AnmitionImgName;
@property(nonatomic,strong)NSTimer *animTimer;
@property(nonatomic,assign)NSInteger numberOfFrames;
@property(nonatomic,assign)NSInteger currentFrame;
@property(nonatomic,assign)float fInterval;

@end


@implementation JHGlobalver

+ (instancetype)sharedSingleton{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = [[self alloc] init];
    });
    
    return sharedSingleton;
}

- (void)startAnimating
{
    self.currentFrame = 0;
    self.animTimer = [NSTimer scheduledTimerWithTimeInterval:_fInterval target:self selector:@selector(onUpdate) userInfo:nil repeats:YES];
}
- (void)stopAnimating
{
    [self.animTimer invalidate];
    [self.item setImage:[NSImage imageNamed:self.defaultImgName]];

   
   
}

-(void)showPopoverWithImagePath:(NSURL *)path andLatex:(NSString *)latex
{
    PopViewController *pController = (PopViewController *)[JHGlobalver sharedSingleton].popover.contentViewController;
    
    pController.textFile.stringValue = latex;
    NSImage *image = [[NSImage alloc]initWithContentsOfURL:path];
    pController.imageView.image = image;
    
     [[JHGlobalver sharedSingleton].popover showRelativeToRect:[JHGlobalver sharedSingleton].item.button.bounds  ofView:[JHGlobalver sharedSingleton].item.button preferredEdge:NSRectEdgeMaxY];
}

-(void)onUpdate
{
    self.currentFrame += 1;
    if (self.currentFrame > self.numberOfFrames ){
        self.currentFrame = 1;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%@%ld",self.AnmitionImgName,self.currentFrame];
    [self.item setImage:[NSImage imageNamed:imageName]];
}

-(void)setStatusDefaultImage:(NSString *)imageName
{
    self.defaultImgName = imageName;
    [self.item setImage:[NSImage imageNamed:self.defaultImgName]];
}
-(void)setAnimationImageName:(NSString *)name imageCount:(NSInteger)count andInterval:(float)fInter
{
    self.AnmitionImgName = name;
    self.numberOfFrames = count;
    self.fInterval = fInter;
}


@end

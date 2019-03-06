//
//  JHGlobalver.h
//  CStatusBar
//
//  Created by GJH on 2019/3/6.
//  Copyright © 2019 GJH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "PopViewController.h"

@interface JHGlobalver : NSObject

@property(strong, nonatomic)NSStatusItem *item;
@property(nonatomic,strong)NSPopover * popover;


+ (instancetype)sharedSingleton;

-(void)showPopoverWithImagePath:(NSURL *)path andLatex:(NSString *)latex;

-(void)setStatusDefaultImage:(NSString *)imageName;
-(void)setAnimationImageName:(NSString *)name imageCount:(NSInteger)count andInterval:(float)fInter;
- (void)startAnimating;
- (void)stopAnimating;


@end

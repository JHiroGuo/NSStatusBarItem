//
//  AppDelegate.m
//  CStatusBar
//
//  Created by GJH on 2019/3/6.
//  Copyright © 2019 GJH. All rights reserved.
//

#import "AppDelegate.h"
#import "JHGlobalver.h"
#import "PopViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self createStatusBar];
    
    [self createPopover];
}



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)createStatusBar
{
    //获取系统单例NSStatusBar对象
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    
    //设置动态宽度的NSStatusItem对象
    NSStatusItem *item = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    
    item.target = self;
    item.action = @selector(touchStatusItem:);
    
    
    //保存到属性变量
    [JHGlobalver sharedSingleton].item = item;
    [[JHGlobalver sharedSingleton] setStatusDefaultImage:@"math"];
    [[JHGlobalver sharedSingleton] setAnimationImageName:@"statusAnimatedIcon_" imageCount:2 andInterval:1];

}

-(void)createPopover
{
    /* 初始化 */
    NSPopover *popover = [[NSPopover alloc]init];
    /* 设置动画 */
    popover.behavior = NSPopoverBehaviorTransient;
    /* 设置外观 */
    popover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
    /* 设置展示视图 */
    popover.contentViewController = [[PopViewController alloc]initWithNibName:@"PopViewController" bundle:nil];
    popover.contentViewController.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    popover.contentViewController.view.wantsLayer = YES;
    [JHGlobalver sharedSingleton].popover = popover;
    /* 设置展示方位 */
//    [popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}

-(void)touchStatusItem:(NSStatusBarButton *)button
{
    [[JHGlobalver sharedSingleton].popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}
@end

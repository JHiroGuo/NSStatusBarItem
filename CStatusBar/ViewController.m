//
//  ViewController.m
//  CStatusBar
//
//  Created by GJH on 2019/3/6.
//  Copyright © 2019 GJH. All rights reserved.
//

#import "ViewController.h"
#import "JHGlobalver.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)StatAnimation:(NSButton *)sender
{
    [[JHGlobalver sharedSingleton]startAnimating];
}
- (IBAction)StopAnimation:(NSButton *)sender
{
    [[JHGlobalver sharedSingleton]stopAnimating];
    NSString *latex = @"y = \sum _ { b } ^ { a } x ^ { 2 }";
    NSURL *path = [NSURL URLWithString:@"file:///Users/gjh/Library/Caches/com.snip.gjh/tex2png--20.png"];
 
    [[JHGlobalver sharedSingleton]showPopoverWithImagePath:path andLatex:latex];
    
    
}

- (IBAction)imageView:(NSImageView *)sender {
}
@end

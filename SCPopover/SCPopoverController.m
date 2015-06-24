//
//  SCPopoverController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverController.h"


@implementation SCPopoverController

-(id)init{
    UIViewController *vc = [UIViewController new];
    vc.view.frame = CGRectMake(0, 0, 500, 500);
    self = [super initWithContentViewController:vc];
    if (self) {
        
    }
    return self;
}

@end

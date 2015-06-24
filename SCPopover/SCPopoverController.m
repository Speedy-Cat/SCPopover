//
//  SCPopoverController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverController.h"
#import "PopoverContentViewController.h"


@implementation SCPopoverController

-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField
{
    PopoverContentViewController *vc = [[PopoverContentViewController new] initWithTableData:data forTextField:(UITextField*)textField];
    self = [super initWithContentViewController:vc];
    if (self) {
        
    }
    return self;
}

@end

//
//  SCTablePopover.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCTablePopover.h"
#import "SCPopoverContentTableViewController.h"

@implementation SCTablePopover

-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField withSize:(CGSize)size withItemSelected:(NSString *)selected withSearchBar:(BOOL)isSearchBar
{
    SCPopoverContentTableViewController *vc = [[SCPopoverContentTableViewController new] initWithTableData:data forTextField:(UITextField*)textField withSize:size withItemSelected:selected withSearchBar:isSearchBar];
    
    self = [self initWithContentViewController:vc];
    if (self) {
        self.popoverContentSize = size;
    }
    return self;
}

@end

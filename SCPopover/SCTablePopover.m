//
//  SCTablePopover.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCTablePopover.h"


@implementation SCTablePopover

-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField withSize:(CGSize)size withItemSelected:(NSString *)selected withSearchBar:(BOOL)isSearchBar
{
    SCPopoverContentTableViewController *contentViewController = [[SCPopoverContentTableViewController new] initWithTableData:data forTextField:(UITextField*)textField withSize:size withItemSelected:selected withSearchBar:isSearchBar];
    
    self = [self initWithContentViewController:contentViewController];
    if (self) {
        contentViewController.delegate = self;
        self.popoverContentSize = size;
    }
    return self;
}

-(void)didContentEndEditing
{
    [self dismissPopoverAnimated:YES];
}

@end

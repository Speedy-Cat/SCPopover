//
//  SCTablePopover.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCTablePopover.h"


@implementation SCTablePopover

-(id)initWithData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections
{
    SCPopoverContentTableViewController *contentViewController = [[SCPopoverContentTableViewController new] initWithData:data forTextField:textField withSize:size withItemSelected:selected withSearchBar:isSearchBar maxSelections:maxSelections];
    
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

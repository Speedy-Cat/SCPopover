//
//  SCTablePopover.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCTablePopover.h"


@implementation SCTablePopover

@synthesize delegate;

-(id)initWithData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections
{
    self.ccontentViewController = [[SCPopoverContentTableViewController new] initWithData:data forTextField:textField withSize:size withItemSelected:selected withSearchBar:isSearchBar maxSelections:maxSelections];
    
    self = [self initWithContentViewController:self.ccontentViewController];
    if (self) {
        self.ccontentViewController.delegate = self;
        self.popoverContentSize = size;
    }
    return self;
}

-(void)didContentEndEditing
{
    [super dismissPopoverAnimated:YES];
}

-(void)didPressDoneButton
{
    if([self.delegate respondsToSelector:@selector(didPressDoneButton)]){
        [self.delegate didPressDoneButton];
    }
    
    [super dismissPopoverAnimated:YES];
}

@end

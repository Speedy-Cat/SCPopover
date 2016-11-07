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
          forTargetView:(UIView*)targetView
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections
{
    self.ccontentViewController = [[SCPopoverContentTableViewController new] initWithData:data forTargetView:targetView withSize:size withItemSelected:selected withSearchBar:isSearchBar maxSelections:maxSelections];
    
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
    if([self.delegate respondsToSelector:@selector(tablePopoverDidPressDoneButton:)]){
        [self.delegate tablePopoverDidPressDoneButton:self];
    }
    
    [super dismissPopoverAnimated:YES];
}

@end

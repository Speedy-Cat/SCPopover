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
        withButtonBar:(BOOL)isButtonBar
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections
{
    self.contentTableViewController = [[SCPopoverContentTableViewController new] initWithData:data forTargetView:targetView withSize:size withItemSelected:selected withButtonBar:isButtonBar withSearchBar:isSearchBar maxSelections:maxSelections];
    
    self = [self initWithContentViewController:self.contentTableViewController];
    if (self) {
        self.contentTableViewController.tablePopoverDelegate = self;
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

//-(void)tablePopover:(SCTablePopover*)tablePopover didSelect:(NSString*)stringSelected;
-(void)didSelectString:(NSString *)stringSelected
{
    if([self.delegate respondsToSelector:@selector(tablePopover:didSelectString:)]){
        [self.delegate tablePopover:self didSelectString:stringSelected];
    }
}

@end

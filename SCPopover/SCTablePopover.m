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
    CGSize sizeCalc = ^CGSize(){
        if (size.width && size.height) {
            return size;
        }
        else{
            int height = ^int(){
                int searchBarHeight = (isSearchBar)?kSearchBarHeight:0;
                int barHeight = (isButtonBar)?kBarHeight:0;
                int itemsHeight = (int)data.count * 44;
                return searchBarHeight + itemsHeight + barHeight;
            }();
            
            
            NSString *longestWord = ^NSString*(){
                NSString *longestWord;
                for(NSString *str in data) {
                    if (longestWord == nil || [str length] > [longestWord length]) {
                        longestWord = str;
                    }
                }
                return longestWord;
            }();//nil;
            
            UIFont *font = [UIFont fontWithName:@"Helvetica Bold" size:17.f];
            
            CGSize size = [longestWord sizeWithAttributes:@{NSFontAttributeName:font}];
            
            return CGSizeMake(size.width + 60, height);
        }
    }();
    self.contentTableViewController = [[SCPopoverContentTableViewController new] initWithData:data forTargetView:targetView withSize:sizeCalc withItemSelected:selected withButtonBar:isButtonBar withSearchBar:isSearchBar maxSelections:maxSelections];
    
    self = [self initWithContentViewController:self.contentTableViewController];
    if (self) {
        self.contentTableViewController.tablePopoverDelegate = self;
        self.contentTableViewController.delegate = self;
        self.popoverContentSize = sizeCalc;
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

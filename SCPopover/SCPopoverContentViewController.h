//
//  SCPopoverContentViewController.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPopoverBarView.h"


@protocol SCPopoverContentDelegate <NSObject>

-(void)didContentEndEditing;

-(void)didPressDoneButton;

@end

@interface SCPopoverContentViewController : UIViewController <SCPopoverBarDelegate>

@property (nonatomic, strong) id <SCPopoverContentDelegate> delegate;

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) UIView *targetView;

/*
 Options selected when press done
 */
@property (strong, nonatomic) NSMutableArray *selected;

/*
 Options selected when the popover is open. If you close the popover with out press "done" those options will not keep.
 */
@property (strong, nonatomic) NSMutableArray *selectedInMemory;

@property (nonatomic) CGSize size;
@property (nonatomic) BOOL isSearchBar;
@property (nonatomic) BOOL isButtonBar;
@property (nonatomic) NSInteger *maxSelections;

-(id)initWithData:(NSArray*)data
          forTargetView:(UIView*)targetView
              withSize:(CGSize)size
      withItemSelected:(NSArray*)selected
        withButtonBar:(BOOL)isButtonBar
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections;

-(void)didPressCancelButton;
-(void)didPressDoneButton;

@end

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
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSMutableArray *selected;
@property (nonatomic) CGSize size;
@property (nonatomic) BOOL isSearchBar;
@property (nonatomic) NSInteger *maxSelections;

-(id)initWithData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSArray*)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections;

-(void)didPressCancelButton;
-(void)didPressDoneButton;

@end

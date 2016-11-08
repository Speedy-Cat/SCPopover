//
//  PopoverContentViewController.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPopoverContentViewController.h"

@protocol SCPopoverTableContentDelegate <SCPopoverContentDelegate>

-(void)didSelectString:(NSString*)stringSelected;

@end

@interface SCPopoverContentTableViewController : SCPopoverContentViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) id <SCPopoverTableContentDelegate> tablePopoverDelegate;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *tableData;

@end

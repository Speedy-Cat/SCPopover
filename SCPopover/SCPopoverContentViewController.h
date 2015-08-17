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

@end

@interface SCPopoverContentViewController : UIViewController <SCPopoverBarDelegate>

@property (nonatomic, strong) id <SCPopoverContentDelegate> delegate;
@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSString *selected;
@property (nonatomic) CGSize size;

-(id)initWithTableData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSString*)selected;

-(void)didPressCancelButton;
-(void)didPressDoneButton;

@end

//
//  SCPopoverController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPickerPopover.h"


@implementation SCPickerPopover

-(id)initWithTableData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSString *)selected
{
    
    size = CGSizeMake(size.width, 216 + kBarHeight);//216px is the max height of picker view
    SCPopoverContentPickerViewController *contentViewController = [[SCPopoverContentPickerViewController new] initWithTableData:data
                                                                                                forTextField:(UITextField*)textField
                                                                                                    withSize:size
                                                                                            withItemSelected:selected];

    
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

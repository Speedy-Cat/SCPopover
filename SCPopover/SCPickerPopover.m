//
//  SCPopoverController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPickerPopover.h"
#import "SCPopoverContentPickerViewController.h"


@implementation SCPickerPopover

-(id)initWithTableData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSString *)selected
{
    
    size = CGSizeMake(size.width, 216 + kBarHeight);//216px is the max height of picker view
    SCPopoverContentPickerViewController *vc = [[SCPopoverContentPickerViewController new] initWithTableData:data
                                                                                                forTextField:(UITextField*)textField
                                                                                                    withSize:size
                                                                                            withItemSelected:selected];
    
    self = [self initWithContentViewController:vc];
    if (self) {
        self.popoverContentSize = size;
    }
    return self;
}


@end

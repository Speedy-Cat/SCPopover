//
//  SCPopoverBarViewController.h
//  SCPopoverTestProject
//
//  Created by Adrian Ortuzar on 17/08/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBarHeight 40
#define kSearchBarHeight 50

@protocol SCPopoverBarDelegate <NSObject>

-(void)didPressCancelButton;
-(void)didPressDoneButton;

@end


@interface SCPopoverBarView : UIView

@property (nonatomic, strong) id <SCPopoverBarDelegate> delegate;

@end

//
//  SCPopoverBarViewController.m
//  SCPopoverTestProject
//
//  Created by Adrian Ortuzar on 17/08/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverBarView.h"

@interface SCPopoverBarView ()

@end

@implementation SCPopoverBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int buttonWidth = 70;
        UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, CGRectGetHeight(self.frame))];
        UIColor *defaultcolor = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1];
        UIColor *highlightedColor = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:0.5];
        [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        [cancelButton setTitleColor:defaultcolor forState:UIControlStateNormal];
        [cancelButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
        [cancelButton addTarget:self
                         action:@selector(pressCancelButton)
               forControlEvents:UIControlEventTouchUpInside];

        //
        UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - buttonWidth, 0, buttonWidth, CGRectGetHeight(self.frame))];
        [doneButton setTitle:@"done" forState:UIControlStateNormal];
        [doneButton addTarget:self
                       action:@selector(pressDoneButton)
             forControlEvents:UIControlEventTouchUpInside];
        [doneButton setTitleColor:defaultcolor forState:UIControlStateNormal];
        [doneButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
        
        //
        [self addSubview:cancelButton];
        [self addSubview:doneButton];
        
    }
    return self;
}

-(void)pressCancelButton
{
    if([self.delegate respondsToSelector:@selector(didPressCancelButton)]){
        [self.delegate didPressCancelButton];
    }
}

-(void)pressDoneButton
{
    if([self.delegate respondsToSelector:@selector(didPressDoneButton)]){
        [self.delegate didPressDoneButton];
    }
}

@end

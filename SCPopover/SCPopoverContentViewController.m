//
//  SCPopoverContentViewController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverContentViewController.h"

@interface SCPopoverContentViewController ()

@end

@implementation SCPopoverContentViewController

-(id)initWithData:(NSArray*)data
          forTargetView:(UIView*)targetView
              withSize:(CGSize)size
      withItemSelected:(NSArray*)selected
        withButtonBar:(BOOL)isButtonBar
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections
{
    self = [super init];
    if(self){
        self.data = data;
        self.targetView = targetView;
        self.size = size;
        self.selected = [[NSMutableArray alloc] initWithArray:selected];
        self.isButtonBar = isButtonBar;
        self.isSearchBar = isSearchBar;
        self.maxSelections = maxSelections;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // add bar
    if (_isButtonBar) {
        SCPopoverBarView *bar = [[SCPopoverBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kBarHeight)];
        bar.delegate = self;
        [self.view addSubview:bar];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.selectedInMemory = [[NSMutableArray alloc] initWithArray:self.selected];
    
    [super viewWillAppear:animated];
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.selectedInMemory = nil;
    
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SCPopoverBarDelegate

-(void)didPressDoneButton
{
    self.selected = self.selectedInMemory;
    
    if([self.delegate respondsToSelector:@selector(didPressDoneButton)]){
        [self.delegate didPressDoneButton];
    }
    
    
}

-(void)didPressCancelButton
{
    // close popover
    if([self.delegate respondsToSelector:@selector(didContentEndEditing)]){
        [self.delegate didContentEndEditing];
    }
}

@end

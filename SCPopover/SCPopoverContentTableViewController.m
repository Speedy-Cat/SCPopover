//
//  PopoverContentViewController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverContentTableViewController.h"

@interface SCPopoverContentTableViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (nonatomic) BOOL isSearchBar;

@end

@implementation SCPopoverContentTableViewController

-(id)initWithTableData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSString*)selected
         withSearchBar:(BOOL)isSearchBar
{
    self = [super init];
    if(self){
        self.tableData = data;
        self.textField = textField;
        self.size = size;
        self.selected = selected;
        self.isSearchBar = isSearchBar;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.view addSubview:self.tableView];
    
    if(self.isSearchBar){
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.size.width, 50)];
        [self.view addSubview:self.searchBar];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if (!_tableView) {
        // set frame depend if it has search bar
        CGRect frame = (self.isSearchBar)? CGRectMake(0, CGRectGetHeight(self.searchBar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.searchBar.frame)) : self.view.frame;
        // init table
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableDataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

#pragma mark - UITableDelegate

/*
 *   the cellForRowAtIndexPath takes for argument the tableView (so if the same object
 *   is delegate for several tableViews it can identify which one is asking for a cell),
 *   and an idexPath which determines which row and section the cell is returned for.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     *   This is an important bit, it asks the table view if it has any available cells
     *   already created which it is not using (if they are offscreen), so that it can
     *   reuse them (saving the time of alloc/init/load from xib a new cell ).
     *   The identifier is there to differentiate between different types of cells
     *   (you can display different types of cells in the same table view)
     */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    /*
     *   If the cell is nil it means no cell was available for reuse and that we should
     *   create a new one.
     */
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
        
    }
    
    /*
     *   Now that we have a cell we can configure it to display the data corresponding to
     *   this row/section
     */
    
    
    cell.textLabel.text = self.tableData[indexPath.row];

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.textField.text = self.tableData[indexPath.row];
}


@end

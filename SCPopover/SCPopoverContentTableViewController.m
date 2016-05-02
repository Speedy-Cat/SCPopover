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
@property (strong, nonatomic) NSArray *tableData;

@end

@implementation SCPopoverContentTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // add seach bar
    if(self.isSearchBar){
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, kBarHeight, self.size.width, 50)];
        self.searchBar.delegate = self;
        [self.view addSubview:self.searchBar];
    }
    
    // add subview
    [self.view addSubview:self.tableView];
    
    // data
    self.tableData = self.data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if (!_tableView) {
        // set frame depend if it has search bar
        CGRect frame = (self.isSearchBar)? CGRectMake(0, CGRectGetHeight(self.searchBar.frame) + kBarHeight, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.searchBar.frame)) : self.view.frame;
        // init table
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    if (searchText.length) {
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",searchText];
        NSArray* filteredData = [self.data filteredArrayUsingPredicate:predicate];
        self.tableData = filteredData;
    }else{
        self.tableData = self.data;
    }
    
    [self.tableView reloadData];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *stringSelected = self.tableData[indexPath.row];
    
    // print the name in the text slide
    if ((int)self.maxSelections == 1) {
        self.textField.text = stringSelected;
    }
    
    
    
    // add/remove the selected
    if ([self.selected containsObject:stringSelected]) {
        [self.selected removeObject:stringSelected];
    }
    else{
        // remove the last selected when is max selecteions done
        if ((int)self.maxSelections && self.selected.count == (int)self.maxSelections) {
            [self.selected removeObjectAtIndex:self.selected.count - 1];
        }
        
        [self.selected addObject:stringSelected];
    }
    
    
    // reload
    [self.tableView reloadData];
    
}

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
    
    
    // set selected rows
    if ([self.selected containsObject:cell.textLabel.text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

#pragma mark - SCPopoverBarDelegate

-(void)didPressDoneButton
{    
    [super didPressDoneButton];
}

-(void)didPressCancelButton
{
    [super didPressCancelButton];
}


@end

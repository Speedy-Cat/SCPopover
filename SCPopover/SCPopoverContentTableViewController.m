//
//  PopoverContentViewController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverContentTableViewController.h"

@interface SCPopoverContentTableViewController ()

@end

@implementation SCPopoverContentTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // add seach bar
    if(self.isSearchBar){
        CGRect searchBarFrame = ^CGRect(){
            int y = (self.isButtonBar)?kBarHeight:0;
            return CGRectMake(0, y, self.size.width, 50);
        }();
        self.searchBar = [[UISearchBar alloc] initWithFrame:searchBarFrame];
        self.searchBar.delegate = self;
        [self.view addSubview:self.searchBar];
    }
    
    // add subview
    [self.view addSubview:self.tableView];
    
    // data
    self.tableData = self.data;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if (!_tableView) {
        // set frame depend if it has search bar
        CGRect frame = ^CGRect(){
            if (self.isSearchBar) {
                int y = (self.isButtonBar)? CGRectGetHeight(self.searchBar.frame) + kBarHeight:CGRectGetHeight(self.searchBar.frame);
                int height = (self.isButtonBar)? CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.searchBar.frame) - kBarHeight : CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.searchBar.frame);
                return CGRectMake(0, y, CGRectGetWidth(self.view.frame), height);
            }
            else{
                int y = (self.isButtonBar)?kBarHeight:0;
                int height = (self.isButtonBar)?CGRectGetHeight(self.view.frame) - kBarHeight:CGRectGetHeight(self.view.frame);
                return CGRectMake(0, y, CGRectGetWidth(self.view.frame), height);
            }
        }();
        
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
    if ((int)self.maxSelections == 1 && [self.targetView isKindOfClass:[UITextField class]]) {
        ((UITextField*)self.targetView).text = stringSelected;
    }

    
    // add/remove the selected
    if ([self.selectedInMemory containsObject:stringSelected]) {
        [self.selectedInMemory removeObject:stringSelected];
    }
    else{
        // remove the last selected when is max selecteions done
        if ((int)self.maxSelections && self.selectedInMemory.count == (int)self.maxSelections) {
            [self.selectedInMemory removeObjectAtIndex:self.selectedInMemory.count - 1];
        }
        
        [self.selectedInMemory addObject:stringSelected];
    }
    
    // apply changes if there is no button bar
    if (!self.isButtonBar) {
        self.selected = self.selectedInMemory;
        
        if([self.tablePopoverDelegate respondsToSelector:@selector(didSelectString:)]){
            [self.tablePopoverDelegate didSelectString:stringSelected];
        }
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
    if ([self.selectedInMemory containsObject:cell.textLabel.text]) {
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

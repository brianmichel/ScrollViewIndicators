//
//  ViewController.m
//  ScrollViewIndicators
//
//  Created by Brian Michel on 4/17/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+ScrollIndicators.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong) UIScrollView *scrollView;
@property (strong) UITableView *tableView;
@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollView.backgroundColor = [UIColor magentaColor];
        //self.scrollView.contentInset = UIEdgeInsetsMake(1, 1, 1, 1);
        self.scrollView.pagingEnabled = YES;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.frame = self.view.bounds;
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3.0, self.view.bounds.size.height * 3.0);
    
    UIScrollView *scrollView = self.scrollView; //set this to self.scrollView to see just a plain scrollview
    [self.view addSubview:scrollView];

    [self setScrollViewIndicatorsForView:scrollView position:ScrollIndicatorPositionHorizontal];
    [self setScrollViewIndicatorsForView:scrollView position:ScrollIndicatorPositionVertical];
}

- (void)setScrollViewIndicatorsForView:(UIScrollView *)view position:(ScrollIndicatorPosition)position {
    UIView *returnView = [view scrollIndicatorForPosition:position];
    if ([returnView isKindOfClass:[UIImageView class]]) {
        //image stuff
        UIImageView *imageView = (UIImageView *)returnView;
        imageView.image = [[UIImage imageNamed:@"icn_scroll"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        imageView.frame = CGRectMake(0, 0, 20, 20);
    } else {
        returnView.backgroundColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [indexPath description];
    
    return cell;
}

@end

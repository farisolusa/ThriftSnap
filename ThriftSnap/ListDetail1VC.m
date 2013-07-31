//
//  ListDetail1VC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ListDetail1VC.h"

@interface ListDetail1VC ()

@end

@implementation ListDetail1VC
@synthesize grpTableView,tableTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:YES];
  self.navigationController.navigationBarHidden = YES;
  
//  self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UITableView DataSource And Delegates
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}
-(NSString  *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return tableTitle;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifer=@"Cell";
  
  UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
  if (cell==nil)
  {
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    
  }
  UITextField *cellTextField=[[UITextField alloc]initWithFrame:CGRectMake(5, 0, 300, 40)];
  [cellTextField setTag:100];
  [cell addSubview:cellTextField];
    return cell;
}

#pragma mark - UIBArBtn Methods
-(IBAction)doneBarBtnPressed:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  CharityVC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "CharityVC.h"

@interface CharityVC ()

@end

@implementation CharityVC
@synthesize charityTableView;

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
  switch (section) {
    case 0:
      return 0;
      break;
    case 1:
      return 1;
      break;
    case 2:
      return 3;
      break;
    default:
      return 1;
      break;
  }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if(section == 0) {
    return @"Proceeds will go to your selcted charity:";
  }
  if(section == 1) {
    return @"FEATURED CHARITY";
  }else if (section == 2) {
    return @"ALL CHARITIES";
  }else{
    return @"";
  }
  
};
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  if(section == 0) {
    return 40.0;
  }else{
    return 30.0;
  }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  if (section==0)
  {
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    label.backgroundColor=[UIColor whiteColor];
    label.text=[tableView.dataSource tableView:tableView titleForHeaderInSection:section];
    label.textColor=[UIColor blackColor];
    label.font=[UIFont fontWithName:@"Georgia-Italic"  size:14];
    [label setTextAlignment:UITextAlignmentCenter];
    [headerView addSubview:label];
    return headerView;
  }
  else
  {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    label.backgroundColor = [UIColor blackColor];
    label.text = [tableView.dataSource tableView:tableView titleForHeaderInSection:section];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Georgia" size:14];
    [label setTextAlignment:UITextAlignmentCenter];
    [headerView addSubview:label];
    return headerView;
  }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifer=@"charityCell";
  
  UITableViewCell *cell;
  if (indexPath.section==0)
  {
    cell=[tableView dequeueReusableCellWithIdentifier:@"introCell"];
    

  if (cell==nil)
  {
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"introCell"];
    
  }
    cell.textLabel.text = @"Proceeds will go to your selected charity:";
    cell.textLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:14];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
  }
  else if([indexPath section] == 1){
    cell = [tableView dequeueReusableCellWithIdentifier:@"featuredCell"];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"featuredCell"];
    }
    cell.imageView.image = [UIImage imageNamed:@"login.png"];
    
    
  }
  else
  {

    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"login.png"];

  }
     return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark - UIBArBtn Methods
-(IBAction)doneBarBtnPressed:(id)sender
{
  //  appDelegate.
  [self.navigationController popViewControllerAnimated:YES];
}
@end

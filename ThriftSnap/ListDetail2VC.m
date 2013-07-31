//
//  ListDetail2VC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ListDetail2VC.h"
#import "AppDelegate.h"

@interface ListDetail2VC ()
{
  AppDelegate *appDelegate;
}
@end

@implementation ListDetail2VC
@synthesize listTableView,tableArray,selectedRow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  selectedRow=[[NSMutableString alloc]init];
  [selectedRow setString:@""];
}
-(void)dealloc
{
  [selectedRow release];
  [super dealloc];
}
- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:YES];
  self.navigationController.navigationBarHidden = YES;
  appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
  
  //  self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UITableView DataSource And Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSLog(@"Count:%d",[tableArray count]);
  return [appDelegate.tableDataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifer=@"Cell";
  
  UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
  if (cell==nil)
  {
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    
  }
  if ([indexPath row]==[selectedRow integerValue])
  {
    cell.accessoryType=UITableViewCellAccessoryCheckmark;

  }
  else
  {
  cell.accessoryType=UITableViewCellAccessoryNone;
  }
     cell.textLabel.text=[appDelegate.tableDataArray objectAtIndex:indexPath.row];
  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [selectedRow setString:[NSString stringWithFormat:@"%d",indexPath.row]];
  [listTableView reloadData];
  
}
#pragma mark - UIBArBtn Methods
-(IBAction)doneBarBtnPressed:(id)sender
{
  
  if ([appDelegate.optionString isEqualToString:@"Condition"])
  {
    [appDelegate.conditionString setString:[appDelegate.tableDataArray objectAtIndex:[selectedRow intValue]]];
  }
  else if([appDelegate.optionString isEqualToString:@"Category"])
  {
    [appDelegate.categoryString setString:[appDelegate.tableDataArray objectAtIndex:[selectedRow intValue]]];
  }
  else if([appDelegate.optionString isEqualToString:@"HandlingTime"])
  {
       [appDelegate.HandlingTymString setString:[appDelegate.tableDataArray objectAtIndex:[selectedRow intValue]]];
  }
  
//  appDelegate.
  [self.navigationController popViewControllerAnimated:YES];
}
@end

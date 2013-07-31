//
//  ListItemsVC.m
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ListItemsVC.h"
#import "ListDetail1VC.h"
#import "ListDetail2VC.h"
#import "ListDetail3VC.h"
#import "MorePhotoVC.h"
#import "DeliveryVC.h"
#import "AppDelegate.h"
#import "CharityVC.h"

@interface ListItemsVC ()
{
  AppDelegate *appDelegate;
}
@end

@implementation ListItemsVC
@synthesize m_TableView,m_ListItemArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
      
    }
  
    return self;
}

#pragma mark - LifeCycle Methods

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
   m_ListItemArray=[[NSArray alloc]initWithObjects:@"Title",@"Category",@"Description",@"Condition",@"More Photos",@"Price",@"Zip Code",@"Handling Time",@"Delivery",@"Charity", nil];
  
  //FooterView

}

- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:YES];
  if (appDelegate.imageState==YES)
  {
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"Take or Choose a Snap" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library", nil];
    sheet.delegate=self;
    [sheet showInView:self.view];
    [sheet release];
    appDelegate.imageState=NO;
    
  
  }
  
  self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
  [m_TableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
 
  
  
}
#pragma mark- UIActionSheet Delegates
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  
  if (buttonIndex==0)
  {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
      
      UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Device has no camera"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
      
      [myAlertView show];
      
    }
    else
    {
      UIImagePickerController *picker = [[UIImagePickerController alloc] init];
      picker.delegate =self;
      picker.allowsEditing = YES;
      picker.sourceType = UIImagePickerControllerSourceTypeCamera;
      
      [self presentViewController:picker animated:YES completion:NULL];
    }}
  else if(buttonIndex==1)
  {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
  }
}
#pragma mark-UIImagePickerContollerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  
  UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
  
  if (![appDelegate.morePhotosArray containsObject:chosenImage])
  {
    [appDelegate.morePhotosArray addObject:chosenImage];
  }
  
  
  [picker dismissViewControllerAnimated:YES completion:NULL];
  
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  
  [picker dismissViewControllerAnimated:YES completion:NULL];
  
}

#pragma mark- UITableView DataSource And Delegates
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//  return 1;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [m_ListItemArray count]+1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifer=@"Cell";
  
  UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
  if (cell==nil)
  {
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    
  }
  if (indexPath.row==10)
  {
    UIButton *resetBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    resetBtn.frame=CGRectMake(10, 5, 140, 35);

    [resetBtn setBackgroundImage:[UIImage imageNamed:@"btn-reset.png"] forState:UIControlStateNormal];
    [resetBtn addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *listMyItemBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
    listMyItemBtn.frame=CGRectMake(160,5,140,35);
    [listMyItemBtn setBackgroundImage:[UIImage imageNamed:@"btn-listitem.png"] forState:UIControlStateNormal];
    
    [listMyItemBtn addTarget:self action:@selector(listMyItemBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:listMyItemBtn];
    [cell addSubview:resetBtn];
    
    return cell;

  }
  else
  {


  cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
  cell.textLabel.text=[m_ListItemArray objectAtIndex:indexPath.row];
  
  
  UILabel *m_DetailLbl=[[UILabel alloc]initWithFrame:CGRectMake(150, 5, 145,30)];
    
  
  if (indexPath.row==1 )
  {
    m_DetailLbl.hidden=NO;
    
    m_DetailLbl.text=appDelegate.categoryString;
  }
else  if (indexPath.row==3 )
  {
      m_DetailLbl.hidden=NO;
   
       m_DetailLbl.text=appDelegate.conditionString;
  }
 else if (indexPath.row==4 )
  {
    
    if ([appDelegate.morePhotosArray count]>0)
    {
      
    m_DetailLbl.hidden=NO;
    m_DetailLbl.text=[NSString stringWithFormat:@"%d photo(s) ",[appDelegate.morePhotosArray count]];
    }
    
   
  }
 else if (indexPath.row==7 )
 {
   m_DetailLbl.hidden=NO;
  
   m_DetailLbl.text=appDelegate.HandlingTymString;
 }
 else if (indexPath.row==8 )
 {
   m_DetailLbl.hidden=NO;
 
   m_DetailLbl.text=appDelegate.deliveryString;
 }
  else
  {
    m_DetailLbl.hidden=YES;
  }
  
  m_DetailLbl.textAlignment=NSTextAlignmentRight;
  m_DetailLbl.textColor=[UIColor colorWithRed:(28.0/255.0) green:(73.0/255.0) blue:(127.0/255.0) alpha:1.0];

  [cell addSubview:m_DetailLbl];
    return cell;
  }
//  return nil;
}
/*
- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  UIView *foorterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)] ;
  //if (section == integerRepresentingYourSectionOfInterest)
  [foorterView setBackgroundColor:[UIColor whiteColor]];
  //else
  //[headerView setBackgroundColor:[UIColor greenColor]];
  
  UIButton *resetBtn=[UIButton buttonWithType:UIButtonTypeCustom];
  resetBtn.frame=CGRectMake(10, 5, 140, 35);
  resetBtn.imageView.image=[UIImage imageNamed:@"btn-reset.png"];
  
  [resetBtn addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  
  
  UIButton *listMyItemBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
                            listMyItemBtn.frame=CGRectMake(160,5,140,35);
  listMyItemBtn.imageView.image=[UIImage imageNamed:@"btn-listitem.png"];
  
  [listMyItemBtn addTarget:self action:@selector(listMyItemBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
  
  
  
    [foorterView addSubview:resetBtn];
   [foorterView addSubview:listMyItemBtn];
  
  //  [headerView release];
  return foorterView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return 44.0f;
}
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.row)
  {
    case 0:
    {
      ListDetail1VC *vc=[[ListDetail1VC alloc]initWithNibName:@"ListDetail1VC" bundle:nil];
      vc.tableTitle=@"Title";
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
      
    }
      break;
      
    case 1:
    {
      ListDetail2VC *vc=[[ListDetail2VC alloc]initWithNibName:@"ListDetail2VC" bundle:nil];
      NSArray *objAray=[[[NSArray alloc]initWithObjects:@"All",@"Accessories",@"Babies and Toddlers",@"Books",@"Clothing(Adults)",@"Clothing(Kids)",@"Collectibles / Art, @DVDs & Videos",@"Electronics",@"Furniture",@"Gift Certificate / Tickets", @"Handbags",@"Health & Beauty",@"Household Items",@"Jewelry",@"Music",@"Pet Supplies",@"Sports / Outdoors",@"Shoes",@"Toys & Games",@"Video Game Software",@"Vehicles",@"Software",nil] autorelease];
      [appDelegate.tableDataArray setArray:objAray];

      [appDelegate.optionString setString:@"Category"];
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];

    }
      break;
    case 2:
    {
      ListDetail1VC *vc=[[ListDetail1VC alloc]initWithNibName:@"ListDetail1VC" bundle:nil];
      vc.tableTitle=@"Description";
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
      
    }
      break;
    case 3:
    {
      ListDetail2VC *vc=[[ListDetail2VC alloc]initWithNibName:@"ListDetail2VC" bundle:nil];
      NSArray *objAray=[[[NSArray alloc]initWithObjects:@"Poor",@"Average",@"Good",@"Almost New",@"Brand New",nil] autorelease];
       [appDelegate.tableDataArray setArray:objAray];
            [appDelegate.optionString setString:@"Conditon"];
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
    }
      break;
    case 4:
    {
      
      MorePhotoVC *vc=[[MorePhotoVC alloc]initWithNibName:@"MorePhotoVC" bundle:nil];
      
      
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
    }
      break;
    case 5:
    {
      ListDetail3VC *vc=[[ListDetail3VC alloc]initWithNibName:@"ListDetail3VC" bundle:nil];
      
      
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
    }
      break;
    case 6:
    {//Zip Code
    }
      break;
    case 7:
    {
      ListDetail2VC *vc=[[ListDetail2VC alloc]initWithNibName:@"ListDetail2VC" bundle:nil];
     NSArray *objAray=[[[NSArray alloc]initWithObjects:@"24 Hours",@"2 Days",@"3 Days",@"Almost 1 Week",nil]autorelease];
       [appDelegate.tableDataArray setArray:objAray];
            [appDelegate.optionString setString:@"HandlingTime"];
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
    }
      break;
  
    case 8:
    {
      DeliveryVC *vc=[[DeliveryVC alloc]initWithNibName:@"DeliveryVC" bundle:nil];
      
      
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
      
    }
      break;
    case 9:
    {
      CharityVC *vc=[[CharityVC alloc]initWithNibName:@"CharityVC" bundle:nil];
      
      
      [self.navigationController pushViewController:vc animated:YES];
      [vc release];
    }
      break;
      
    default:
      break;
  }
}
#pragma mark- IBActions
-(IBAction)resetButtonPressed:(id)sender
{

//
  [m_TableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:0 animated:YES];
  
  appDelegate.deliveryString=nil;
  appDelegate.HandlingTymString=nil;
  appDelegate.conditionString=nil;
  appDelegate.categoryString=nil;
  [appDelegate.morePhotosArray removeAllObjects];
  [m_TableView reloadData];
}
-(IBAction)listMyItemBtnPressed:(id)sender
{
  
}
@end

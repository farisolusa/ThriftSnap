//
//  DeliveryVC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "DeliveryVC.h"
#import "ListDetail2VC.h"
#import <QuartzCore/QuartzCore.h>

@interface DeliveryVC ()

@end

@implementation DeliveryVC
@synthesize inPersonView,USPSView,packageTypeView;
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
  
  inPersonView.layer.cornerRadius=12.0;
  inPersonView.layer.borderWidth=1.0f;
  inPersonView.layer.masksToBounds=YES;
  
  USPSView.layer.cornerRadius=12.0;
  USPSView.layer.borderWidth=1.0f;
  USPSView.layer.masksToBounds=YES;
  
  packageTypeView.layer.cornerRadius=12.0;
  packageTypeView.layer.borderWidth=1.0f;
  packageTypeView.layer.masksToBounds=YES;
}
- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:YES];
  self.navigationController.navigationBarHidden = YES;
  
  //  self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIBArBtn Methods
- (IBAction)packageBtnPressed:(id)sender
{
  ListDetail2VC *vc=[[ListDetail2VC alloc]initWithNibName:@"ListDetail2VC" bundle:nil];
  [vc.tableArray initWithObjects:@"Flat Rate",@"Other Box or Envelope",nil];
  
  [self.navigationController pushViewController:vc animated:YES];
  [vc release];
}


-(IBAction)doneBarBtnPressed:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}
@end

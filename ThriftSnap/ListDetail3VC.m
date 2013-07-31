//
//  ListDetail3VC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ListDetail3VC.h"
#import <QuartzCore/QuartzCore.h>

@interface ListDetail3VC ()

@end

@implementation ListDetail3VC
@synthesize offersSwitch,offerView,priceTxtField,retailPriceTxtField;

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
  offerView.layer.cornerRadius=12.0;
  offerView.layer.masksToBounds=YES;
  offerView.layer.borderWidth=1.0f;
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
-(IBAction)doneBarBtnPressed:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}
@end

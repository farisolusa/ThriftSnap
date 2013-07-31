//
//  ListDetail3VC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListDetail3VC : UIViewController<UITextFieldDelegate>


@property(nonatomic,retain)IBOutlet UITextField *priceTxtField;
@property(nonatomic,retain)IBOutlet UITextField *retailPriceTxtField;
@property(nonatomic,retain)IBOutlet UISwitch *offersSwitch;
@property(nonatomic,retain)IBOutlet UIView *offerView;

-(IBAction)doneBarBtnPressed:(id)sender;
@end

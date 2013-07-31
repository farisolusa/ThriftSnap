//
//  MorePhotoVC.m
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "MorePhotoVC.h"
#import "AppDelegate.h"
@interface MorePhotoVC ()
{
  AppDelegate *appDelegate;
}
@end

@implementation MorePhotoVC

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
   appDelegate=[(AppDelegate*)[UIApplication sharedApplication]delegate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)camBtnPressed:(id)sender
{
//  switch ([sender tag])
//  {
//    case 101:
//      
//    {
      UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"Take or Choose a Snap" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library", nil];
      sheet.delegate=self;
      [sheet showInView:self.view];
      [sheet release];
//    }
//      break;
//
//    case 102:
//    {
//      UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"Take or Choose a Snap" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library", nil];
//      sheet.delegate=self;
//      [sheet showInView:self.view];
//      [sheet release];
//  }
//      break;
//
//    case 103:
//    {
//      UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"Take or Choose a Snap" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library", nil];
//      sheet.delegate=self;
//      [sheet showInView:self.view];
//      [sheet release];
//    }
//      break;
//
//    default:
//      break;
//  }
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
#pragma mark - UIBArBtn Methods
-(IBAction)doneBarBtnPressed:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}
@end

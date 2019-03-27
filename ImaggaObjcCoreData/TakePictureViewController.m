//
//  TakePictureViewController.m
//  ImaggaObjcCoreData
//
//  Created by Jenny Chang on 26/03/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "TakePictureViewController.h"

@interface TakePictureViewController () <UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property(nonatomic, assign) id<UINavigationControllerDelegate,
UIImagePickerControllerDelegate> delegate;

@end

@implementation TakePictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)takePictureTapped:(id)sender {
    
    UIAlertController *ac = [[UIAlertController alloc] init];
    UIAlertAction *takePhoto = [[UIAlertAction alloc] init];
    UIAlertAction *photoLib = [[UIAlertAction alloc] init];
    UIAlertAction *cancel = [[UIAlertAction alloc] init];
    
    [ac addAction:takePhoto];
    [ac addAction:photoLib];
    [ac addAction:cancel];
    
    [self presentViewController:ac animated:true completion:nil];
    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//
//    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
//        <#statements#>
//    }
}

@end

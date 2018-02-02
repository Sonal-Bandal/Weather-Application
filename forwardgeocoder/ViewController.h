//
//  ViewController.h
//  forwardgeocoder
//
//  Created by Felix-ITS 004 on 03/11/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "newoneViewController.h"
#define key @"78929349d2d537e714d8996cc50cc478"
#define url @"https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%@&units=metric"


@interface ViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textfieldoutlet;

@property (strong, nonatomic) IBOutlet MKMapView *mymapview;
@property NSString *mykey;
//-(void)getlat :(float)Andlon :(float)f;
@property (strong, nonatomic) IBOutlet UIButton *btn11;

- (IBAction)btnaction1:(id)sender;
-(void)getlocationdetailsoflatitutde:(float)lat1 andlongitudedetailswith :(float)lon1 andkeydetailswith:(NSString *)nkey;

@property float la,lo;



@property NSString *temperature,*humidity,*descriptionn,*namee;
//@property NSString *des;

-(void)parsedata;

@property (strong, nonatomic) IBOutlet UITextField *tfield1;

- (IBAction)nextdetailsaction:(id)sender;


@end


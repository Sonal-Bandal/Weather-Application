//
//  ViewController.m
//  forwardgeocoder
//
//  Created by Felix-ITS 004 on 03/11/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "ViewController.h"
#import "newoneViewController.h"
//CGFloat lat,lon;
//NSString *name,*temp,*humidity,*des;

NSDictionary *d1,*d2,*mydic;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mykey=key;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)find
{
    NSString *location=self.textfieldoutlet.text;
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks && placemarks.count>0) {
            CLPlacemark *topresult=[placemarks objectAtIndex:0];
            MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topresult];
            
            MKCoordinateRegion region=self.mymapview.region;
            region.center=placemark.region.center;
            region.span.latitudeDelta/=8.0;
            region.span.longitudeDelta /=8.0;
            CGFloat lat,lon;
//            lat=region.center.latitude;
//            lon=region.center.longitude;
           [self.mymapview setRegion:region animated:YES];
            [self.mymapview addAnnotation:placemark];
            
            
            self.la=region.center.latitude;
            self.lo=region.center.longitude;
            
            
            
            
            [self getlocationdetailsoflatitutde:self.la andlongitudedetailswith:self.lo andkeydetailswith:self.mykey];
            NSLog(@"latitiude=%f and longitude=%f",self.la,self.lo);
            [self parsedata];
            
            
            
            
        }
    }];

}
-(void)getlocationdetailsoflatitutde:(float)lat1 andlongitudedetailswith :(float)lon1 andkeydetailswith:(NSString *)nkey
{
       NSString *str=[NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%@&units=metric",lat1,lon1,self.mykey];
    NSLog(@"url is : %@",str);
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *location=self.textfieldoutlet.text;
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks && placemarks.count>0) {
            CLPlacemark *topresult=[placemarks objectAtIndex:0];
            MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topresult];
            
            MKCoordinateRegion region=self.mymapview.region;
            region.center=placemark.region.center;
            region.span.longitudeDelta /=8.0;
            region.span.longitudeDelta /=8.0;
            
            
            
            [self.mymapview setRegion:region animated:YES];
            [self.mymapview addAnnotation:placemark];
            
            
           // self.la=region.center.latitude;
           // self.lo=region.center.longitude;
            
            //[self find];
            [self getlocationdetailsoflatitutde:self.la andlongitudedetailswith:self.lo andkeydetailswith:self.mykey];

            
                    }
    }];
    
    return YES;
}
- (IBAction)btnaction1:(id)sender
{
    [self find];
    
}




-(void)parsedata
{
    NSString *str1=@"https://api.openweathermap.org/data/2.5/weather?lat=18.520763&lon=73.884384&appid=78929349d2d537e714d8996cc50cc478&units=metric";
    NSURL *url1=[NSURL URLWithString:str1];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:url1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *myresponse=(NSHTTPURLResponse *)response;
        if (myresponse.statusCode==200) {
            //NSLog(@"response found");
            
            if(data)
            {
                NSLog(@"data found");
                NSLog(@"data is :%@",response);
                NSDictionary *mydic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                if (error) {
                    NSLog(@"error is :%@",error.localizedDescription);
                    
                }
                else
                {
                    NSDictionary *maindictinary=[mydic valueForKey:@"main"];
                    NSLog(@"dictionary under coord dictoinary  is = = = %@",maindictinary);
                    
                    _humidity=[maindictinary valueForKey:@"humidity"];
                    NSLog(@"humidity is = = = %@",_humidity);
                    _temperature=[maindictinary valueForKey:@"temp"];
                    NSLog(@"temp is = = =",_temperature);
                    NSDictionary *tweather = [mydic valueForKey:@"weather"];
                    NSLog(@"Weather = = %@",tweather);
                    _descriptionn= [tweather valueForKey:@"description"];
                    NSLog(@"Description = = =  %@",_descriptionn);
                    _namee=[mydic valueForKey:@"name"];
                    
                    NSLog(@"name dic is = = = %@",_namee);
                    
                }
            }
            else
            {
                NSLog(@"data not found");
            }
            
        }
        else
        {
            NSLog(@"response not found");
        }
        
    }];
    [datatask resume];
//
//    NSLog(@"first dic ic : %@",first);
}
- (IBAction)nextdetailsaction:(id)sender
{
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"VievController" bundle:nil];
    [self parsedata];
    newoneViewController *nvc =[self.storyboard instantiateViewControllerWithIdentifier:@"newoneViewController"];

    nvc.description1=self.descriptionn;
    nvc.temmperature1=self.temperature;
    nvc.humidity1=self.humidity;
    nvc.name1=_namee;
    [self.navigationController pushViewController:nvc animated:YES];
    
    //n.selectedName=pname;
    //_label1.text=self.selectedName;
    }
@end // here we are not using request authorization in plist because we are just giving server the curretn location and it is finding the location..and in reversegeocoder we are not searching particular location,..rather it is just updating the locations so there we need to provide the authorization....for USER REQUEST FOR ONLY SECURITY...


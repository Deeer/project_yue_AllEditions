//
//  FirstViewController.m
//  project_yue
//
//  Created by Dee on 15/5/22.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "FirstViewController.h"
#import "DetaiViewController.h"
#import "MakeDataVC.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
//#import "MakeDataViewController.h"

#define APIKey @"7af104a836c93503730248a9d476dca9"

@interface FirstViewController ()<MAMapViewDelegate,AMapSearchDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    
        MAMapView *_mapView;
        AMapSearchAPI *_search;
        CLLocation *_currentLocation;
        NSArray *_pois;
        UITableView *_tableView;
        NSMutableArray *_annotations;
        UIButton *_locationBtn;
        UIView * _contantView;

    
}


@end

@implementation FirstViewController

-(void)initAttributes
{
    _annotations = [NSMutableArray array];
    _pois= nil;
}

-(void)initSearch
{
    _search =[[AMapSearchAPI alloc]initWithSearchKey:APIKey Delegate:self];
}

-(void)initControls
{
   
    _contantView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-88, CGRectGetWidth(_mapView.bounds), 40)];
    _contantView.backgroundColor= [UIColor whiteColor];
    
    _locationBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _locationBtn.frame =CGRectMake(20, CGRectGetHeight(_mapView.bounds)-80, 40, 40);
    _locationBtn.autoresizingMask= UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    _locationBtn.backgroundColor =[UIColor whiteColor];
    _locationBtn.layer.cornerRadius = 5;
    [_locationBtn addTarget:self action:@selector(locationAction) forControlEvents:UIControlEventTouchUpInside];
    [_locationBtn setImage:[UIImage imageNamed:@"lineDashTexture"] forState:UIControlStateNormal];
    NSString *title =@"◎";
    [_locationBtn setTitle:title forState:UIControlStateNormal];
    
    UIButton *showAllMap = [[UIButton alloc]initWithFrame:CGRectMake(60, CGRectGetHeight(_mapView.bounds)-80, 40, 40)];
    showAllMap.backgroundColor = [UIColor whiteColor];
    [showAllMap setTitle:@"〒" forState:UIControlStateNormal];
    showAllMap.layer.cornerRadius = 5;
//    [showAllMap clipsToBounds];
        showAllMap.autoresizingMask= UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [_mapView addSubview:showAllMap];
    [showAllMap addTarget:self action:@selector(showAllMapView) forControlEvents:UIControlEventTouchUpInside];
    
    [_mapView addSubview:_locationBtn];
    

    
    UIButton *SearchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    SearchBtn.frame= CGRectMake(CGRectGetWidth(_mapView.bounds)*0.5,0,self.view.frame.size.width*0.5, 40);
    [SearchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    SearchBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    SearchBtn.backgroundColor =[UIColor lightGrayColor];
    [SearchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_contantView addSubview:SearchBtn];
    

    UIButton *dataBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0 , self.view.frame.size.width*0.5, 40)];
    dataBtn.backgroundColor =[UIColor orangeColor];
    [dataBtn addTarget:self action:@selector(MakeAData) forControlEvents:UIControlEventTouchUpInside];
    [dataBtn setTitle:@"约一下" forState:UIControlStateNormal];
    [_contantView addSubview:dataBtn];
    [self.view addSubview:_contantView];
    
}
-(void)showAllMapView
{
    [UIView animateWithDuration:0.1 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.3 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
        _mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, CGRectGetHeight(self.view.bounds));
        _contantView.frame = CGRectMake(0, self.view.frame.size.height-88, CGRectGetWidth(_mapView.bounds), 40);
        _tableView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds), self.view.frame.size.width, CGRectGetHeight(self.view.bounds)*0.5+40-120);
        _locationBtn.frame =CGRectMake(20, CGRectGetHeight(_mapView.bounds)-140, 40, 40);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)MakeAData
{
    MakeDataVC *dateVc =[[MakeDataVC alloc]initWithNibName:@"MakeDataVC" bundle:nil];
    
    [self.navigationController pushViewController:dateVc animated:YES];

}
-(void)initTableView
{
    CGFloat halfHeight =CGRectGetHeight(self.view.bounds)*0.5+40;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, CGRectGetWidth(self.view.bounds), halfHeight-128) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
}


-(void)searchAction
{
//    NSLog(@"----%@",_searchBar.text);
    
    
    
    [UIView animateWithDuration:0.1 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, CGRectGetHeight(self.view.bounds)*0.5);
        
        _contantView.frame = CGRectMake(0, self.view.frame.size.height*0.5-40, CGRectGetWidth(_mapView.bounds), 40);
        _tableView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)*0.5, self.view.frame.size.width, CGRectGetHeight(self.view.bounds)*0.5+40-128);
        
                _locationBtn.frame =CGRectMake(20, CGRectGetHeight(_mapView.bounds)-80, 40, 40);
        
    } completion:^(BOOL finished) {

    }];
    
    if (_currentLocation ==nil||_search ==nil  ) {
        
        NSLog(@"search failed");
        [self.view endEditing:YES];
        return;
    }
    [self.view endEditing:YES];
    AMapPlaceSearchRequest *request =[[AMapPlaceSearchRequest alloc]init];
    request.searchType = AMapSearchType_PlaceAround;
    request.location =[AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    request.keywords =@"运动";
    [_search AMapPlaceSearch:request];
    
}
-(void)locationAction
{
    if(_mapView.userTrackingMode != MAUserTrackingModeFollow)
    {
        [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    }
    
}

-(void)initMapView
{

    [MAMapServices sharedServices].apiKey= APIKey;
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate=self;
    
    
    _mapView.compassOrigin =CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);
    [self.view addSubview:_mapView];
    
    
}
-(void)reGeoaction
{
    if (_currentLocation) {
        AMapReGeocodeSearchRequest *request =[[AMapReGeocodeSearchRequest alloc]init];
        request.location =[AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
        [_search AMapReGoecodeSearch:request];
    }
}

- (void)viewDidLoad {
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapView.showsUserLocation =YES;
    [self initMapView];
    [self locationAction];
    [self initTableView];
    [self initSearch];
    [self initControls];
    [self initAttributes];
    self.title = @"约一下";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    CLLocation *currentLocation =userLocation.location;
    _currentLocation = [userLocation.location copy];
}


-(void)searchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"request:%@--error:%@",request,error);
    
}
-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
//    NSLog(@"response:%@",response);
    NSString *title =response.regeocode.addressComponent.city;
    if (title.length==0) {
        title =response.regeocode.addressComponent.province;
    }
    _mapView.userLocation.title =title;
    _mapView.userLocation.subtitle =response.regeocode.formattedAddress;
    
}
-(void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        [self reGeoaction];
    }
}
-(void)onPlaceSearchDone:(AMapPlaceSearchRequest *)request response:(AMapPlaceSearchResponse *)response
{
//    NSLog(@"request :%@",request);
//    NSLog(@"responce :%@",response);
    
    if (response.pois.count>0) {
        _pois =response.pois;
        [_tableView reloadData];
        [_mapView removeAnnotations:_annotations];
        [_annotations removeAllObjects];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _pois.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"spp";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    AMapPOI*poi =_pois[indexPath.row];
    cell.textLabel.text =poi.name;
    cell.detailTextLabel.text =poi.address;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AMapPOI *poi =_pois[indexPath.row];
    MAPointAnnotation *annotation =[[MAPointAnnotation alloc]init];
    annotation.coordinate =CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
    annotation.title= poi.name;
    annotation.subtitle =poi.address;
    NSMutableArray *MessArr = [NSMutableArray arrayWithObjects:poi.name,poi.address, nil];
    NSLog(@"%@",MessArr);
    [_annotations addObject:annotation];
    [_mapView addAnnotation:annotation];
    
    DetaiViewController *detailController=[[DetaiViewController alloc]init];
    detailController.MessageArray =MessArr;
    
    [self presentViewController:detailController animated:YES completion:nil];
    
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"dee";
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 50;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//    btn.backgroundColor =[UIColor redColor];
//    [btn addTarget:self action:@selector(MakeAData) forControlEvents:UIControlEventTouchUpInside];
////    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
////    view.backgroundColor =[UIColor orangeColor];
////    
////    [view addSubview:btn];
//    
//    return btn;
//}

//-(void)MakeAData
//{
//    MakeDataViewController *dataViewController =[[MakeDataViewController alloc]init];
//    
////    
////    [self.navigationController pushViewController:dataViewController animated:YES];
//    dataViewController.modalPresentationStyle =UIModalPresentationFormSheet;
//    
//    [self presentViewController:dataViewController animated:YES completion:^{
//        
//    }];
////    NSLog(@"---");
//    
//}


-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString*ID2 =@"anno";
        MAPinAnnotationView *annotationView=(MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:ID2];
        if (annotationView==nil) {
            annotationView =[[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID2];
        }
        
        annotationView.canShowCallout = YES;
        return annotationView;
    }
    return nil;
}
/*
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame =CGRectMake(0, -60,self.view.frame.size.width,self.view.frame.size.height);
    }];
    
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.2 animations:^{
          self.view.frame =CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height);
    }];
}
*/

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self searchAction];
    
}
@end

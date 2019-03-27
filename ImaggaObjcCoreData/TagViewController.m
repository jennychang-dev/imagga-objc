#import "TagViewController.h"
#import <UNIRest.h>
#import "Tags/Tag.h"
#import "TableViewCell.h"

@interface TagViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray <Tag*> *tags;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRequest];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


-(void)getRequest {
    
    NSDictionary *headers = @{@"accept": @"application/json",
                               @"authorization": @"Basic YWNjXzhiN2FkZGU4Mjk0OTgxNDpjYjc1ZjBmNTI2NTVmNzVhNWI0YzFhMzQwODUxMGNiYQ=="};
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.imagga.com/v1/tagging?url=https://ichef.bbci.co.uk/news/660/cpsprodpb/8CF1/production/_85718063_000327593-1.jpg"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        
                                                        NSError *jsonError;
                                                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                                        
                                                        if (jsonError) {
                                                            NSLog(@"json error has occurred: %@",jsonError);
                                                        }
                                                        
                                                        [self populateTags:json];
                                                    }
                                                }];
    [dataTask resume];
}

-(void)populateTags:(NSDictionary *)json {
    
    NSArray <NSDictionary*> *results = json[@"results"][0][@"tags"];
    
    self.tags = [[NSMutableArray alloc] init];
    for (NSDictionary *tag in results) {
        
        NSInteger confidence = [tag[@"confidence"] integerValue];
        NSString *confidenceString = [[NSString stringWithFormat:@"%ld", (long)confidence] stringByAppendingString:@"%"];
        
        Tag *eachTag = [[Tag alloc] initWith:tag[@"tag"] andConfidence: confidenceString];
        [self.tags addObject:eachTag];
        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.tableView reloadData];
    });
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.tagLabel.text = self.tags[indexPath.row].tag;
    cell.tagConfidenceLabel.text = self.tags[indexPath.row].confidenceLevel;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tags.count;
}


@end

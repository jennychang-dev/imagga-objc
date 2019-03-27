//
//  TableViewCell.h
//  ImaggaObjcCoreData
//
//  Created by Jenny Chang on 26/03/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagConfidenceLabel;


@end

NS_ASSUME_NONNULL_END

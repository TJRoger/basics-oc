//
//  Person+Eat.h
//  Category
//
//  Created by Roger Luo on 2022/3/9.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Eat)

- (void)eat;

+ (void)eatMeal;

- (void)run;

@property (copy, nonatomic) NSString* meal;

@property (strong, nonatomic) int weight;
@end

NS_ASSUME_NONNULL_END

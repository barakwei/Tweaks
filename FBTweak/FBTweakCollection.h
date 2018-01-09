/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

@class FBTweak;

/**
  @abstract A named collection of tweaks.
 */
@interface FBTweakCollection : NSObject <NSCoding>

- (instancetype)init NS_UNAVAILABLE;

/**
  @abstract Creates a tweak collection.
 */
- (instancetype)initWithName:(NSString *)name tweaks:(NSArray<FBTweak *> *)tweaks NS_DESIGNATED_INITIALIZER;

/**
  @abstract The name of the collection.
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
  @abstract The tweaks contained in this collection.
 */
@property (nonatomic, copy, readonly) NSArray<FBTweak *> *tweaks;

/**
  @abstract Fetches a tweak by identifier.
  @param identifier The tweak identifier to find.
  @discussion Only search tweaks in this collection.
 */
- (FBTweak *)tweakWithIdentifier:(NSString *)identifier;

@end

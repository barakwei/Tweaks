/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBTweakCollection.h"
#import "FBTweak.h"

@implementation FBTweakCollection {
  NSArray *_orderedTweaks;
  NSMutableDictionary *_identifierTweaks;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  NSString *name = [coder decodeObjectForKey:@"name"];
  NSArray<FBTweak *> *tweaks = [[coder decodeObjectForKey:@"tweaks"] copy];

  return [self initWithName:name tweaks:tweaks];
}

- (instancetype)initWithName:(NSString *)name tweaks:(NSArray<FBTweak *> *)tweaks
{
  if ((self = [super init])) {
    _name = [name copy];
    _orderedTweaks = tweaks;
    _identifierTweaks = [[NSMutableDictionary alloc] initWithCapacity:4];
    for (FBTweak *tweak in self.tweaks) {
      [_identifierTweaks setObject:tweak forKey:tweak.identifier];
    }
  }
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:_name forKey:@"name"];
  [coder encodeObject:_orderedTweaks forKey:@"tweaks"];
}

- (FBTweak *)tweakWithIdentifier:(NSString *)identifier
{
  return _identifierTweaks[identifier];
}

- (NSArray *)tweaks
{
  return [_orderedTweaks copy];
}

@end

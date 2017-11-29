// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   APIs Discovery Service (discovery/v1)
// Description:
//   Provides information about other Google APIs, such as what APIs are
//   available, the resource, and method details for each API.
// Documentation:
//   https://developers.google.com/discovery/

#import "GTLRDiscoveryQuery.h"

#import "GTLRDiscoveryObjects.h"

@implementation GTLRDiscoveryQuery

@dynamic fields;

@end

@implementation GTLRDiscoveryQuery_ApisGetRest

@dynamic api, version;

+ (instancetype)queryWithApi:(NSString *)api
                     version:(NSString *)version {
  NSArray *pathParams = @[
    @"api", @"version"
  ];
  NSString *pathURITemplate = @"apis/{api}/{version}/rest";
  GTLRDiscoveryQuery_ApisGetRest *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.api = api;
  query.version = version;
  query.expectedObjectClass = [GTLRDiscovery_RestDescription class];
  query.loggingName = @"discovery.apis.getRest";
  return query;
}

@end

@implementation GTLRDiscoveryQuery_ApisList

@dynamic name, preferred;

+ (instancetype)query {
  NSString *pathURITemplate = @"apis";
  GTLRDiscoveryQuery_ApisList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:nil];
  query.expectedObjectClass = [GTLRDiscovery_DirectoryList class];
  query.loggingName = @"discovery.apis.list";
  return query;
}

@end

// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Cloud Resource Manager API (cloudresourcemanager/v1)
// Description:
//   The Google Cloud Resource Manager API provides methods for creating,
//   reading, and updating project metadata.
// Documentation:
//   https://cloud.google.com/resource-manager

#import "GTLRCloudResourceManager.h"

// ----------------------------------------------------------------------------
// Authorization scopes

NSString * const kGTLRAuthScopeCloudResourceManagerCloudPlatform = @"https://www.googleapis.com/auth/cloud-platform";
NSString * const kGTLRAuthScopeCloudResourceManagerCloudPlatformReadOnly = @"https://www.googleapis.com/auth/cloud-platform.read-only";

// ----------------------------------------------------------------------------
//   GTLRCloudResourceManagerService
//

@implementation GTLRCloudResourceManagerService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://cloudresourcemanager.googleapis.com/";
    self.batchPath = @"batch";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint", @"pp" ];
  }
  return self;
}

@end

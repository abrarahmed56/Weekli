// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Spectrum Database API (spectrum/v1explorer)
// Description:
//   API for spectrum-management functions.
// Documentation:
//   http://developers.google.com/spectrum

#import "GTLRSpectrum.h"

@implementation GTLRSpectrumService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://www.googleapis.com/";
    self.servicePath = @"spectrum/v1explorer/paws/";
    self.batchPath = @"batch/spectrum/v1explorer";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint" ];
  }
  return self;
}

+ (NSDictionary<NSString *, Class> *)kindStringToClassMap {
  return @{
    @"spectrum#pawsGetSpectrumBatchResponse" : [GTLRSpectrum_PawsGetSpectrumBatchResponse class],
    @"spectrum#pawsGetSpectrumResponse" : [GTLRSpectrum_PawsGetSpectrumResponse class],
    @"spectrum#pawsInitResponse" : [GTLRSpectrum_PawsInitResponse class],
    @"spectrum#pawsNotifySpectrumUseResponse" : [GTLRSpectrum_PawsNotifySpectrumUseResponse class],
    @"spectrum#pawsRegisterResponse" : [GTLRSpectrum_PawsRegisterResponse class],
    @"spectrum#pawsVerifyDeviceResponse" : [GTLRSpectrum_PawsVerifyDeviceResponse class],
  };
}

@end

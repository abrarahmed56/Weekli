// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Cloud Video Intelligence API (videointelligence/v1beta1)
// Description:
//   Cloud Video Intelligence API.
// Documentation:
//   https://cloud.google.com/video-intelligence/docs/

#import "GTLRCloudVideoIntelligenceObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest.features
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest_Features_FeatureUnspecified = @"FEATURE_UNSPECIFIED";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest_Features_LabelDetection = @"LABEL_DETECTION";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest_Features_SafeSearchDetection = @"SAFE_SEARCH_DETECTION";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest_Features_ShotChangeDetection = @"SHOT_CHANGE_DETECTION";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation.level
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation_Level_FrameLevel = @"FRAME_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation_Level_LabelLevelUnspecified = @"LABEL_LEVEL_UNSPECIFIED";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation_Level_SegmentLevel = @"SEGMENT_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation_Level_ShotLevel = @"SHOT_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation_Level_VideoLevel = @"VIDEO_LEVEL";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation.adult
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Adult_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation.medical
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Medical_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation.racy
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Racy_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation.spoof
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Spoof_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation.violent
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation_Violent_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext.labelDetectionMode
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext_LabelDetectionMode_FrameMode = @"FRAME_MODE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext_LabelDetectionMode_LabelDetectionModeUnspecified = @"LABEL_DETECTION_MODE_UNSPECIFIED";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext_LabelDetectionMode_ShotAndFrameMode = @"SHOT_AND_FRAME_MODE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext_LabelDetectionMode_ShotMode = @"SHOT_MODE";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame.pornographyLikelihood
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_LikelihoodUnspecified = @"LIKELIHOOD_UNSPECIFIED";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame_PornographyLikelihood_VeryUnlikely = @"VERY_UNLIKELY";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation.level
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation_Level_FrameLevel = @"FRAME_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation_Level_LabelLevelUnspecified = @"LABEL_LEVEL_UNSPECIFIED";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation_Level_SegmentLevel = @"SEGMENT_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation_Level_ShotLevel = @"SHOT_LEVEL";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation_Level_VideoLevel = @"VIDEO_LEVEL";

// GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation.adult
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_Likely = @"LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_Possible = @"POSSIBLE";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_Unknown = @"UNKNOWN";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_Unlikely = @"UNLIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_VeryLikely = @"VERY_LIKELY";
NSString * const kGTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation_Adult_VeryUnlikely = @"VERY_UNLIKELY";

// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1AnnotateVideoProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1AnnotateVideoProgress
@dynamic annotationProgress;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationProgress" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationProgress class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1AnnotateVideoResponse
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1AnnotateVideoResponse
@dynamic annotationResults;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationResults" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationResults class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoProgress
@dynamic annotationProgress;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationProgress" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationProgress class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoRequest
@dynamic features, inputContent, inputUri, locationId, outputUri, videoContext;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"features" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoResponse
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1AnnotateVideoResponse
@dynamic annotationResults;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationResults" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationResults class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelAnnotation
@dynamic descriptionProperty, languageCode, locations;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"locations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelLocation
@dynamic confidence, level, segment;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation
@dynamic adult, medical, racy, spoof, timeOffset, violent;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationProgress
@dynamic inputUri, progressPercent, startTime, updateTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationResults
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoAnnotationResults
@dynamic error, inputUri, labelAnnotations, safeSearchAnnotations,
         shotAnnotations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1LabelAnnotation class],
    @"safeSearchAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1SafeSearchAnnotation class],
    @"shotAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoSegment class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoContext
@dynamic labelDetectionMode, labelDetectionModel, safeSearchDetectionModel,
         segments, shotChangeDetectionModel, stationaryCamera;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"segments" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoSegment class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoSegment
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta1VideoSegment
@dynamic endTimeOffset, startTimeOffset;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2AnnotateVideoProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2AnnotateVideoProgress
@dynamic annotationProgress;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationProgress" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationProgress class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2AnnotateVideoResponse
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2AnnotateVideoResponse
@dynamic annotationResults;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"annotationResults" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationResults class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2Entity
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2Entity
@dynamic descriptionProperty, entityId, languageCode;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentAnnotation
@dynamic frames;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"frames" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2ExplicitContentFrame
@dynamic pornographyLikelihood, timeOffset;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelAnnotation
@dynamic categoryEntities, entity, frames, segments;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"categoryEntities" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2Entity class],
    @"frames" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelFrame class],
    @"segments" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelSegment class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelFrame
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelFrame
@dynamic confidence, timeOffset;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelSegment
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelSegment
@dynamic confidence, segment;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationProgress
@dynamic inputUri, progressPercent, startTime, updateTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationResults
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoAnnotationResults
@dynamic error, explicitAnnotation, frameLabelAnnotations, inputUri,
         segmentLabelAnnotations, shotAnnotations, shotLabelAnnotations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"frameLabelAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelAnnotation class],
    @"segmentLabelAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelAnnotation class],
    @"shotAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoSegment class],
    @"shotLabelAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2LabelAnnotation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoSegment
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1beta2VideoSegment
@dynamic endTimeOffset, startTimeOffset;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelAnnotation
@dynamic descriptionProperty, languageCode, locations;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"locations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelLocation
@dynamic confidence, level, segment;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation
@dynamic adult, time;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationProgress
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationProgress
@dynamic inputUri, progressPercent, startTime, updateTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationResults
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoAnnotationResults
@dynamic error, inputUri, labelAnnotations, safeSearchAnnotations,
         shotAnnotations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1LabelAnnotation class],
    @"safeSearchAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1SafeSearchAnnotation class],
    @"shotAnnotations" : [GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoSegment class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoSegment
//

@implementation GTLRCloudVideoIntelligence_GoogleCloudVideointelligenceV1VideoSegment
@dynamic endTime, startTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleLongrunningOperation
//

@implementation GTLRCloudVideoIntelligence_GoogleLongrunningOperation
@dynamic done, error, metadata, name, response;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleLongrunningOperation_Metadata
//

@implementation GTLRCloudVideoIntelligence_GoogleLongrunningOperation_Metadata

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleLongrunningOperation_Response
//

@implementation GTLRCloudVideoIntelligence_GoogleLongrunningOperation_Response

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleRpcStatus
//

@implementation GTLRCloudVideoIntelligence_GoogleRpcStatus
@dynamic code, details, message;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"details" : [GTLRCloudVideoIntelligence_GoogleRpcStatus_Details_Item class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudVideoIntelligence_GoogleRpcStatus_Details_Item
//

@implementation GTLRCloudVideoIntelligence_GoogleRpcStatus_Details_Item

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end

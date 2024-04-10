using my.complaints as service from '../db/schema';
using {StoreTasks as external} from './external/StoreTasks.csn';


service CatalogService {
  entity Status       as projection on service.Status;
  entity Stores       as projection on service.Stores;
  entity Complaints   as projection on service.Complaints;
  entity Resolutions  as projection on service.Resolutions;
  entity Media        as projection on service.Media;

  entity StoreSurveys as
    projection on external.SurveyTaskSet {
      key StoreNumber,
      key TaskId
    };
}

service Store {
  @cds.persistence: {
    table,
    skip: false
  }

  @cds.autoexpose
  entity Surveys      as
    projection on external.SurveyTaskSet {
      key StoreNumber,
      key TaskId,
          Status,
          Type,
          CurrentAttempt,
          NumberOfAttempts,
          0 as PendingNumberOfAttempts : Int16
    };
}

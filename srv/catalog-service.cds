using my.complaints as service from '../db/schema';

service CatalogService {
    entity Complaints as projection on  service.Complaints
    entity Resolutions as projection on service.Resolutions;
    entity Media as projection on service.Media;
}
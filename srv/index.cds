using from './catalog-service';


annotate CatalogService.Complaints with @(
    UI: {
        Identification: [ {Value: title} ],
        SelectionFields: [ title ],
        LineItem: [
            {Value: ID},
            {Value: title},
            {Value: status},
            {Value: store}
        ],
        HeaderInfo: {
            TypeName: '{i18n>Complaint}',
            TypeNamePlural: '{i18n>Complaints}',
            Title: {Value: title}
        }
    }
);

annotate CatalogService.Complaints with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    title @title:'{i18n>Title}';
    status @title:'{i18n>Status}';
    store @title:'{i18n>Store}';
}
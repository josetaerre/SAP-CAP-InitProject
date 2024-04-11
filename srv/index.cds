using from './catalog-service';


annotate CatalogService.Complaints with @(
    UI: {
            // Search bars
            Identification: [ {Value: title} ],
            // SelectionFields: [ title ], // Custom filter search fields

            // Header info  of the list (title of the list) and of the object page (when an item is clicked on the list os complaints and navigating)
            HeaderInfo: {
                TypeName: '{i18n>Complaint}',
                TypeNamePlural: '{i18n>Complaints}',

                ImageUrl : '../dollarcity.png',

                @title: '{i18n>Complaint}',
                Title: {
                    Value: title
                },

                @description: '{i18n>ComplaintId}',
                Description: {
                    Value: id
                    // , Label: '{i18n>ComplaintId}'
                }
                // Image: '../dollarcity.png'
            },

            // List of items of the Complaint entity service
            LineItem: [
                {
                    Label: 'ComplaintId',
                    Value: id
                },
                {
                    Label: 'Title',
                    Value: title
                },
                {
                    Label: 'CurrentStatus',
                    Value: status.description,
                    Criticality: #Information
                },
                {
                    Label: 'StoreName',
                    Value: store.name
                },
                {
                    Label: 'HasResolutions',
                    Value: resolutions.id
                }
            ]
        },

        UI.Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>StoreFacetGroup}',
                Target: '@UI.FieldGroup#ComplaintResolutionsHeader'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>ResolutionsFacetGroup}',
                Target: 'resolutions/@UI.LineItem'
            }
        ],

        UI.FieldGroup#ComplaintResolutionsHeader: {
            Data: [
                
                {
                    Label: 'Hardcoded Store Name',
                    Value: 'store.name'
                },
                {
                    Label: '{i18n>StoreId}',
                    Value: store.ID
                },
                {
                    Label: '{i18n>StoreName}',
                    Value: store.name
                }
            ]
        },

        UI.FieldGroup#ComplaintResolutionsItems: {
            Data: [
                
                {
                    Label: 'Hardcoded Store Name',
                    Value: 'store.name'
                },
                {
                    Label: '{i18n>StoreId}',
                    Value: store.ID
                },
                {
                    Label: '{i18n>StoreName}',
                    Value: store.name
                },
                {
                    Label: '{i18n>ComplaintId}',
                    Value: id
                }
            ]
        }
    );

annotate CatalogService.Complaints with {
    id @title:'{i18n>ID}' @UI.HiddenFilter;
    title @title:'{i18n>Title}';
    status @title:'{i18n>Status}';
};

annotate CatalogService.Resolutions with {
    id @title:'{i18n>ID}' @UI.HiddenFilter;
    description @title:'{i18n>de}';
};

annotate CatalogService.Resolutions with @(
    UI: {
            // Search bars
            SelectionFields: [ ], // No custom filter search fields


                        // Header info  of the list (title of the list) and of the object page (when an item is clicked on the list os complaints and navigating)
            HeaderInfo: {
                TypeName: '{i18n>Resolution}',
                TypeNamePlural: '{i18n>Resolutions}',

                ImageUrl : '../dollarcity.png',

                @title: '{i18n>Resolution}',
                Title: {
                    Value: description
                },

                @description: '{i18n>ResolutionId}',
                Description: {
                    Value: id
                    // , Label: '{i18n>ComplaintId}'
                }
            },

            // List of items of the Complaint entity service
            LineItem: [
                {
                    Label: '{i18n>ResolutionId}',
                    Value: id
                },
                {
                    Label: '{i18n>Description}',
                    Value: description
                }
            ]
    }
);
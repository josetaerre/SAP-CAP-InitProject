namespace my.complaints;

using { cuid, managed } from '@sap/cds/common';
// using { Country } from '@sap/cds/common';
using { Language } from '@sap/cds/common';
// type Currency : Association to sap.common.Currencies;
 type storeId : String(4);
 type Identifier: String(10);
 type Item: Int16;

entity Complaints: managed {
    key id : Identifier;
    title       : String;
    status      : Int16;
    store       : Association to one Stores;
    mediaFiles  : Association to many Media;
    resolutions : Association to many Resolutions on resolutions.complaint = $self;
}

entity Resolutions: managed {
    key id : Identifier;
    description : String;
    complaint   : Association to Complaints;
}

entity Pictures: managed {
    key ID      : UUID;
        @Core.MediaType: 'image/png'
        content : LargeBinary;
}

entity Media : cuid, managed {
    complaint: Association to one Complaints on complaint.mediaFiles = $self;
    // @Core.MediaType: mediaType  @Core.ContentDisposition.Filename: filename  data : LargeBinary;
    // @Core.IsMediaType mediaType: String;
    // filename: String;
    @Core.MediaType: 'image/png' content: LargeBinary;
    // fileName: String;
}

entity Object : cuid, managed {
    @Core.MediaType: mediaType  @Core.ContentDisposition.Filename: filename  data : LargeBinary;
    @Core.IsMediaType mediaType                                                   : String;
    filename                                                                      : String;
}

entity Stores {
    key ID: storeId;
    name: String;
    address: String;
    // country: Country;
}

entity Status {
    key ID: Int16;
    description: String;
    Language: Language
}
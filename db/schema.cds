namespace my.complaints;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Complaints : cuid, managed {
    title       : String;
    status      : String;
    store       : String;
    resolutions : Association to many Resolutions;
    mediaFiles  : Association to many Media;
}

entity Resolutions : cuid, managed {
    accepted    : Boolean;
    description : String;
    complaint   : Association to one Complaints
                      on complaint.resolutions = $self;
}


entity Pictures {
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


entity Object : cuid {
    @Core.MediaType: mediaType  @Core.ContentDisposition.Filename: filename  data : LargeBinary;
    @Core.IsMediaType mediaType                                                   : String;
    filename                                                                      : String;
}

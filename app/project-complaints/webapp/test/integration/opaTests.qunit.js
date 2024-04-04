sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectcomplaints/test/integration/FirstJourney',
		'projectcomplaints/test/integration/pages/ComplaintsList',
		'projectcomplaints/test/integration/pages/ComplaintsObjectPage',
		'projectcomplaints/test/integration/pages/ResolutionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ComplaintsList, ComplaintsObjectPage, ResolutionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectcomplaints') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheComplaintsList: ComplaintsList,
					onTheComplaintsObjectPage: ComplaintsObjectPage,
					onTheResolutionsObjectPage: ResolutionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
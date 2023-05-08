sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/listreport/listreportapp/test/integration/FirstJourney',
		'ns/listreport/listreportapp/test/integration/pages/BooksList',
		'ns/listreport/listreportapp/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/listreport/listreportapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);
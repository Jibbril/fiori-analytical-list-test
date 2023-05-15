sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'foldablegroups/test/integration/FirstJourney',
		'foldablegroups/test/integration/pages/BooksList',
		'foldablegroups/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('foldablegroups') + '/index.html'
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
using MyService as service from '../../srv/my-service';

annotate service.Books with @UI.LineItem  : [
    { Value: name },
    { Value: totalSold },
    { Value: price },
    { Value: stock },
    { Value: authorName },
    { Value: virtualAuthorName },
    { Value: genre },
    { Value: releaseYear },
    { Value: releaseDate },
];

annotate service.Books with @UI.SelectionFields: [
    genre,
    authorName,
    releaseYear,
    price,
    totalSold,
];

annotate service.Books with @UI.PresentationVariant: {
    GroupBy: [
        // genre
        // authorName
    ],
    Total: [ 
        price,
        stock,
        totalSold 
    ],
    Visualizations: [
        '@UI.Chart',
        '@UI.LineItem'
    ]
};

annotate service.Books with @UI.Chart: {
    ChartType: #Column,
    Dimensions: [ genre],
    DimensionAttributes: [
        // { 
        //     Dimension: genre,
        //     Role: #Category
        // },
    ],
    Measures: [ 
        price, 
    ],
    MeasureAttributes: [
        { 
            Measure: price,
            Role: #Axis1
        },
        // { 
        //     Measure: stock,
        //     Role: #Axis1
        // }
    ]
};
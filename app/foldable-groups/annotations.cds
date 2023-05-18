using MyService as service from '../../srv/my-service';

annotate service.Books with @UI.LineItem  : [
    { Label: 'Title', Value: name },
    { Label: 'author.name', Value: author.name },
    { Label: 'Price', Value: price },
    { Label: 'authorName', Value: authorName },
    { Label: 'virtualAuthorName', Value: virtualAuthorName },
    { Label: 'genre', Value: genre },
    { Label: 'stock', Value: stock },
];

annotate service.Books with @UI.SelectionFields: [
    genre,
    authorName,
    // price,
    // stock,
];

annotate service.Books with @UI.PresentationVariant: {
    GroupBy: [
        genre
        // authorName
    ],
    Total: [ 
        price 
    ],
    Visualizations: [
        '@UI.Chart',
        '@UI.LineItem'
    ]
};

annotate service.Books with @UI.Chart: {
    ChartType: #Column,
    Dimensions: [ name, genre],
    DimensionAttributes: [
        // { 
        //     Dimension: name,
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
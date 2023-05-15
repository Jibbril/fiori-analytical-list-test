using MyService as service from '../../srv/my-service';

annotate service.Books with @UI.LineItem  : [
    { Label: 'Title', Value: name },
    { Label: 'author.name', Value: author.name },
    { Label: 'Price', Value: price },
    { Label: 'authorName', Value: authorName },
    { Label: 'virtualAuthorName', Value: virtualAuthorName },
];

annotate service.Books with @UI.SelectionPresentationVariant : {
    $Type   : 'UI.SelectionPresentationVariantType',
    Text    : 'My SelectionPresentationVariant',
    SelectionVariant : {
        $Type : 'UI.SelectionVariantType',
        SelectOptions : [
        ],
        Text : 'My SelectionVariant'
    },
    PresentationVariant : {
        $Type : 'UI.PresentationVariantType',
        MaxItems : 30,
        Visualizations : [
            '@UI.Chart',
            '@UI.LineItem'
        ],  
        GroupBy : [
            name
        ],
        SortOrder : [
        ]
    }
};

annotate service.Books with @UI.PresentationVariant: {
    GroupBy: [
        authorName
    ],
    Total: [ price ],
    Visualizations: [
        '@UI.LineItem'
    ]
};

annotate service.Books with @UI.Chart: {
    ChartType: #Column,
    Dimensions: [ name ],
    DimensionAttributes: [
        { 
            Dimension: name,
            Role: #Category
        }
    ],
    Measures: [ price ],
    MeasureAttributes: [
        { 
            Measure: price,
            Role: #Axis1
        }
    ]
};
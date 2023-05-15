using MyService as service from '../../srv/my-service';

annotate service.Books with @UI.LineItem  : [
    { Label: 'Title', Value: name },
    { Label: 'Author', Value: author.name },
    { Label: 'Price', Value: price },
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
        MaxItems : 4,
        Visualizations : [
            '@UI.Chart',
            '@UI.LineItem'
        ],  
        SortOrder : [
        ]
    }
};

annotate service.Books with @UI.Chart: {
    $Type: 'UI.ChartDefinitionType',
    Title: 'Books',
    ChartType: #Bar,
    Dimensions: [
        author_id
    ],
    DimensionAttributes: [
        {
            Dimension: author_id,
            Role: #Category
        }
    ],
    Measures: [
        price
    ],
    MeasureAttributes: [
        {
            Measure: price,
            Role: #Axis1
        }
    ]
};

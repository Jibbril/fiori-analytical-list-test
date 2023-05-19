using MyService as service from '../../srv/my-service';

annotate service.Books with @UI.LineItem  : [
    { Value: name },
    { Value: totalSold },
    { Value: price },
    { Value: stock },
    { Value: authorName },
    { Value: genre },
    { Value: releaseYear },
    { Value: releaseDate },
];

annotate service.Books with @UI.SelectionFields: [
    genre,
    authorName,
    releaseYear,
    releaseDate,
    name,
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

annotate service.Books with @(
    UI.SelectionPresentationVariant : {
        $Type : 'UI.SelectionPresentationVariantType',
        Text : 'Default',
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            Text : 'Default',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : totalSold,
                    Ranges : [
                        {
                            $Type : 'UI.SelectionRangeType',
                            Sign : #I,
                            Option : #GE,
                            Low : 50000000,
                        },
                    ],
                },
            ],
        },
        PresentationVariant: ![@UI.PresentationVariant],
    }
);

annotate service.Books with @(
    UI.SelectionPresentationVariant #view1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        Text : 'More than 50M',
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            Text : 'More than 50M',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : totalSold,
                    Ranges : [
                        {
                            $Type : 'UI.SelectionRangeType',
                            Sign : #I,
                            Option : #GE,
                            Low : 50000000,
                        },
                    ],
                },
            ],
        },
        PresentationVariant: ![@UI.PresentationVariant],
    }
);

annotate service.Books with @(
    UI.SelectionPresentationVariant #view2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        Text : 'Less than 50M',
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            Text : 'Less than 50M',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : totalSold,
                    Ranges : [
                        {
                            $Type : 'UI.SelectionRangeType',
                            Sign : #I,
                            Option : #LE,
                            Low : 50000000,
                        },
                    ],
                },
            ],
        },
        PresentationVariant: ![@UI.PresentationVariant],
    }
);
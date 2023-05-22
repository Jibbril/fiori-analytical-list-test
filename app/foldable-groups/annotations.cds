using MyService as service from '../../srv/my-service';
using from './annotations/kpi';

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

annotate service.Books with @UI.PresentationVariant#default: {
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
        '@UI.Chart#default',
        '@UI.LineItem'
    ]
};

annotate service.Books with @UI.PresentationVariant#noChart: {
    Visualizations: [ '@UI.LineItem' ]
};

annotate service.Books with @UI.Chart #default: {
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
        // { 
        //     Measure: price,
        //     Role: #Axis1,
        //     DataPoint: '@UI.DataPoint#price'
        // },
    ]
};

annotate service.Books with @UI.SelectionVariant #default: {
    $Type : 'UI.SelectionVariantType',
    Text : 'Default',
    SelectOptions : [],
};

annotate service.Books with @UI.SelectionVariant #genreFiction: {
    $Type : 'UI.SelectionVariantType',
    Text : 'Genre Fiction',
    SelectOptions : [{
            $Type : 'UI.SelectOptionType',
            PropertyName : genre,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #I,
                    Option : #EQ,
                    Low : 'fiction',
                },
            ],
        }],
};

annotate service.Books with @UI.SelectionVariant #genreFantasy: {
    $Type : 'UI.SelectionVariantType',
    Text : 'Genre Fantasy',
    SelectOptions : [{
            $Type : 'UI.SelectOptionType',
            PropertyName : genre,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #I,
                    Option : #EQ,
                    Low : 'fantasy',
                },
            ],
        }],
};

annotate service.Books with @UI.SelectionVariant #GE50M: {
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
};

annotate service.Books with @UI.SelectionVariant #LE50M: {
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
};

// annotate service.Books with @(UI.SelectionPresentationVariant: {
//     $Type : 'UI.SelectionPresentationVariantType',
//     Text : 'Default',
//     SelectionVariant : ![@UI.SelectionVariant#GE50M],
//     PresentationVariant: ![@UI.PresentationVariant#noChart],
// });

annotate service.Books with @(UI.SelectionPresentationVariant #default: {
    $Type : 'UI.SelectionPresentationVariantType',
    Text : 'Default',
    SelectionVariant : ![@UI.SelectionVariant#default],
    PresentationVariant: ![@UI.PresentationVariant#default],
});

annotate service.Books with @(UI.SelectionPresentationVariant #view1 : {
    $Type : 'UI.SelectionPresentationVariantType',
    Text : 'More than 50M',
    SelectionVariant : ![@UI.SelectionVariant#GE50M],
    PresentationVariant: ![@UI.PresentationVariant#default],
});

annotate service.Books with @(UI.SelectionPresentationVariant #view2 : {
    $Type : 'UI.SelectionPresentationVariantType',
    Text : 'Less than 50M',
    SelectionVariant : ![@UI.SelectionVariant#LE50M],
    PresentationVariant: ![@UI.PresentationVariant#default],
});
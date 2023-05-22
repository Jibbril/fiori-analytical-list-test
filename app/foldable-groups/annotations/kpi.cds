using MyService as service from '../../../srv/my-service';

annotate service.Books with @UI.KPI #KPIPrice: {
    ID: 'SomeNiceId',
    DataPoint: ![@UI.DataPoint#KPIPrice],
    SelectionVariant: ![@UI.SelectionVariant#SVForKPIPrice],
    Detail:{
        $Type: 'UI.KPIDetailType',
        SemanticObject: 'Books',
        Action: 'display',
        DefaultPresentationVariant: ![@UI.PresentationVariant#KPIPrice],
    }
};

annotate service.Books with @UI.DataPoint #KPIPrice: {
    Title: 'Price',
    Value: price,
    Description: 'Price of the book',
};

annotate service.Books with @UI.SelectionVariant #SVForKPIPrice: {
    Parameters: [
        {
            $Type: 'UI.Parameter',
            PropertyName: price,
            PropertyValue: 'EUR'
        },
    ],
};

annotate service.Books with @UI.PresentationVariant #KPIPrice: {
    Visualizations: [
        '@UI.Chart#KPIPrice',
    ]
};

annotate service.Books with @UI.Chart #KPIPrice : {
    Title : 'Price yo',
    MeasureAttributes : [
        {
            $Type : 'UI.ChartMeasureAttributeType',
            Measure : price,
            Role : #Axis1
        },
    ],
    DimensionAttributes : [
        {
            $Type : 'UI.ChartDimensionAttributeType',
            Dimension : genre,
            Role : #Category
        },
    ],
    ChartType : #Bar,
    Description : 'Some nice price chart.'
};
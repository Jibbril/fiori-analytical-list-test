
using MyService as service from '../my-service';

annotate service.Books with @(Aggregation : { 
    // CustomAggregates needed for ALP Table display/totals
    CustomAggregate #price : 'Edm.Decimal',
    CustomAggregate #totalSold : 'Edm.Int32',
    CustomAggregate #stock : 'Edm.Int32',
    ApplySupported: {
        GroupableProperties: [ genre, authorName, releaseYear, name, releaseDate],
        AggregatableProperties: [
            { Property: stock, },
            { Property: price, },
            { Property: totalSold, },
        ],
        // Transformations below if you want to limit the available 
        // transformations. If omitted then all are available. 
        // Transformations: [
        //     'sum',
        //     'filter',
        //     ...
        // ]
    }
});

annotate service.Books with @(Analytics : {
    AggregatedProperty #totalSoldSum: {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'TotalSoldSum',
        AggregationMethod : 'sum',
        AggregatableProperty : totalSold,
        ![@Common.Label] : 'Total Sold Sum',
    },

    AggregatedProperty #totalSoldAvg : {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'TotalSoldAvg',
        AggregationMethod : 'average',
        AggregatableProperty : totalSold,
        ![@Common.Label] : 'Total Sold Average',
    },
});

annotate service.Books with {
    @Common.Label: 'Genre' 
    genre;
    
    // Needed when using the CustomAggregation 
    // variant of annotating a measure 
    @Aggregation.default: #AVG 
    @Common.Label: 'Average Price'
    price;

    @Aggregation.default: #SUM
    @Common.Label: 'Total Sold'
    totalSold;

    @Aggregation.default: #SUM
    @Common.Label: 'Stock'
    stock;
}
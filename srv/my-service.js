module.exports = srv => {
    srv.after('READ', 'Books', each => {
        each.virtualAuthorName = each.authorName;
    })
}
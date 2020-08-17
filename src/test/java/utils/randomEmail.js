function fn() {
    var strValues = "abcdefghijklmnopqrstuvwxyz1234567890";
    var domainExtensions = ['.com', '.net', '.bg', '.eastcoastisland'];
    var strEmail = "";
    var strTmp;

    for (var i = 0; i < 10; i++) {
        strTmp = strValues.charAt(Math.round(strValues.length * Math.random()));
        strEmail = strEmail + strTmp;
    }

    strTmp = "";
    strEmail = strEmail + "@";
    for (var j = 0; j < 8; j++) {
        strTmp = strValues.charAt(Math.round(strValues.length * Math.random()));
        strEmail = strEmail + strTmp;
    }

    strEmail = strEmail + domainExtensions[Math.floor(Math.random() * domainExtensions.length)];
    return strEmail;
}
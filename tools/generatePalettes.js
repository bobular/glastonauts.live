var ColorScheme = require('color-scheme');

var scheme = new ColorScheme
var variations = ['default', 'soft', 'pastel', 'light', 'hard'];
console.log("[");
for (let i = 0; i < 360; i++) {
    for (let j = 0; j < variations.length; j++) {
        const variation = variations[j];
        
        scheme.from_hue(i)         // Start the scheme 
        .scheme('contrast')     
        .variation(variation);   // Use the 'soft' color variation
        var colors = scheme.colors();
        console.log('["#' + colors[0] + '", "#' + colors[4] + '"],');
        // console.log('["#' + colors[0] + '", "#' + colors[7] + '"],');
        // console.log('["#' + colors[1] + '", "#' + colors[6] + '"],');
        // console.log('["#' + colors[2] + '", "#' + colors[5] + '"],');
        // console.log('["#' + colors[3] + '", "#' + colors[4] + '"],');

    }
}
console.log("]");


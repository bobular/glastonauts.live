(function ($) {

    let $schedule = $('.schedule');
    let $montage = $('#montage');
    $schedule.hide();
    $montage.hide();

    /* ********* HELPER FUNCTIONS ********** */

    // Taken from https://stackoverflow.com/questions/7208624/check-if-element-is-before-or-after-another-element-in-jquery
    $.fn.isAfter = function (sel) {
        return this.prevAll().filter(sel).length !== 0;
    };

    $.fn.isBefore = function (sel) {
        return this.nextAll().filter(sel).length !== 0;
    };

    /* ********* WINDOW LOAD ********** */
    jQuery(window).load(function () {

        console.log($montage);
        let $dates = $('h3');

        let row_count = $dates.length;
        let column_count = 0;
        let cells = [];
        let $covers = $(".svg-cover");
        // $covers.addEventListener('load', function () {
        //     alert("loaded");
        // }, true);

        // build an index of covers per row

        $dates.each(function (i) {
            console.log("P",i)
            let count = 0;
            // not efficient but it would do
            $covers.each(function (k) {
                if ($(this).isAfter($dates[i]) &&
                ($(this).isBefore($dates[i + 1]) || $dates[i + 1] === undefined)) {
                        console.log(k);
                    if (Array.isArray(cells[i])) {
                        cells[i].push($(this))
                    } else {
                        cells[i] = [$(this)];
                    }
                    count++;
                }
            })

            if (count > column_count) column_count = count;
        })

        console.log("Takis", column_count, row_count, cells);
        
        
        
        cells.forEach(function(row, i) {
            let content = `<div class='tile is-ancestor'></div>`;
            $montage.append(content);
            let $row = $montage.children('.tile').last();
            // row.forEach(function(cell, j) {
            for (let k = 0; k < column_count; k++) {
                console.log(i,k)
                cell = row[k] ? row[k] : 
                '<img src="assets/owner/images/montage-filler.jpeg" alt="cover art" class="svg-cover img-responsive">';
                if (cell) {
                    // console.log(cell);
                    $row.append(cell);

                } else {

                }
            }
        })

        let availWidth = 800 - column_count*10;
        $('.svg-cover').width(availWidth / column_count).height(availWidth / column_count);
        $montage.show();
        

    });


})(jQuery);

(function ($) {

    let windowHeight = window.innerHeight - 30;
    let windowWidth = window.innerWidth - 30;
    // let width = windowHeight > 800 ? 800 : windowHeight;
    let margin = 5;
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

    // taken from https://stackoverflow.com/questions/31656689/how-to-save-img-to-users-local-computer-using-html2canvas
    function saveAs(uri, filename) {
        var link = document.createElement('a');
        if (typeof link.download === 'string') {
            link.href = uri;
            link.download = filename;

            //Firefox requires the link to be in the body
            document.body.appendChild(link);

            //simulate click
            link.click();

            //remove the link when done
            document.body.removeChild(link);
        } else {
            window.open(uri);
        }
    }

    /* ********* WINDOW LOAD ********** */
    jQuery(window).load(function () {

        // $('h4').remove();
        let $dates = $('h3');


        let row_count = $dates.length;
        let column_count = 0;
        let cells = [];
        let $covers = $(".cover, .svg-cover");
        // $covers.addEventListener('load', function () {
        //     alert("loaded");
        // }, true);

        // build an index of covers per row

        $dates.each(function (i) {
            let count = 0;
            // not efficient but it would do
            $covers.each(function (k) {
                if ($(this).isAfter($dates[i]) &&
                    ($(this).isBefore($dates[i + 1]) || $dates[i + 1] === undefined)) {
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



        cells.forEach(function (row, i) {
            let content = `<div class='montage-row'></div>`;
            $montage.append(content);
            let $row = $montage.children('.montage-row').last();
            // row.forEach(function(cell, j) {
            for (let k = 0; k < column_count; k++) {
                cell = row[k] ? row[k] :
                    '<img src="assets/owner/images/montage-filler.jpeg" alt="cover art" class="filler cover img-responsive">';
                if (cell) {
                    $row.append(cell);

                } else {

                }
            }
        })

        // let dimension = column_count > row_count ? column_count : row_count;
        let dimension = 0;
        // let units = windowHeight > windowWidth ? windowWidth : windowHeight;
        let units = 0;
        // let availUnits;
        if (windowHeight > windowWidth) {
            dimension = column_count;
            units = windowWidth
        } else {
            dimension = row_count;
            units = windowHeight;
        }
        console.log(dimension, units);
        let availUnits = units - dimension * margin * 2;
        let coverSize = availUnits / dimension;
        $montage.width((coverSize + margin * 2) * column_count);
        $montage.height((coverSize + margin * 2) * row_count);
        $('.cover, .svg-cover').css("margin", margin)
            .width(availUnits / dimension)
            .height(availUnits / dimension);

        $('.filler').click(function () {
            $('.selected').removeClass('selected');
            $(this).addClass('selected');
        })

        $('.move').click(function () {
            let direction = $(this).hasClass('move-left') ? 'left' : 'right';
            let $selected = $('.selected').first();

            if ($selected.hasClass('selected')) {

                if (direction === 'left') {
                    $selected.prev().before($selected);
                } else {
                    $selected.next().after($selected);
                }

            }
        })

        $("#clear").click(function () {
            $('.selected').removeClass('selected');
        });


        $('.montage-row').height(coverSize + 10).width((coverSize + 10) * column_count + 1);
        $montage.show();

    });


})(jQuery);

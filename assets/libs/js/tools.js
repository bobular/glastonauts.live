(function ($) {

    let width = 800;
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

        console.log($montage);
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
            console.log("P", i)
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



        cells.forEach(function (row, i) {
            let content = `<div class='montage-row'></div>`;
            $montage.append(content);
            let $row = $montage.children('.montage-row').last();
            // row.forEach(function(cell, j) {
            for (let k = 0; k < column_count; k++) {
                console.log(i, k)
                cell = row[k] ? row[k] :
                    '<img src="assets/owner/images/montage-filler.jpeg" alt="cover art" class="filler cover img-responsive">';
                if (cell) {
                    // console.log(cell);
                    $row.append(cell);

                } else {

                }
            }
        })

        let availWidth = width - column_count * margin * 2;
        $montage.width(width);
        $('.cover, .svg-cover').css("margin", margin)
            .width(availWidth / column_count)
            .height(availWidth / column_count);

        $('.filler').click(function () {
            $('.selected').removeClass('selected');
            $(this).addClass('selected');
            console.log(this);
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


        $('.montage-row').height(width / row_count).width(width);
        $montage.show();

    });


})(jQuery);

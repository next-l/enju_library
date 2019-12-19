// The following code was originally written by Ralph Bean. Thanks Ralph!
// http://groups.google.com/group/jquery-ui/msg/f11601f56737a129

function saveOrder(year, month, day, root_path) {
    $(".column").each(function(index, value){
        var columnId = value.id;
        var cookieName = "listOrder" + columnId;
        // Get the order for this column.
        var order = $('#' + columnId).sortable("toArray");
        // For each portlet in the column
        for ( var i = 0, n = order.length; i < n; i++ ) {
            var v = $('#' + order[i] ).find('.portlet-content').is(':visible');
            // Modify the array we're saving to indicate what's open and
            //  what's not. 
            order[i] = order[i] + ":" + v;
        }
        $.cookie(cookieName, order, { path: root_path, expiry: new Date(year, month, day)});
    });
}

// function that restores the list order from a cookie
function restoreOrder() {
    $(".column").each(function(index, value) {
        var columnId = value.id;
        var cookieName = "listOrder" + columnId;
        var cookie = $.cookie(cookieName);
        if ( cookie == null ) { return; }
        var IDs = cookie.split(",");
        for (var i = 0, n = IDs.length; i < n; i++ ) {
            var toks = IDs[i].split(":");
            if ( toks.length != 2 ) {
                continue;
            }
            var portletId = toks[0];
            var visible = toks[1];
            var portlet = $(".column")
                .find('#' + portletId)
                .appendTo($('#' + columnId));
            if (visible === 'false') {
                portlet.find(".ui-icon").toggleClass("ui-icon-minus");
                portlet.find(".ui-icon").toggleClass("ui-icon-plus");
                portlet.find(".portlet-content").hide();
            }
        }
    });
}

$(document).ready( function () {
    $(".column").sortable({
        connectWith: ['.column'],
        stop: function() { saveOrder(); }
    });

    $(".portlet")
        .addClass("ui-widget ui-widget-content")
        .addClass("ui-helper-clearfix ui-corner-all")
        .find(".portlet-header")
        .addClass("ui-widget-header ui-corner-all")
        .prepend('<span class="ui-icon ui-icon-minus"></span>')
        .end()
        .find(".portlet-content");
});


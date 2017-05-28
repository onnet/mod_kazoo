{% if m.kazoo[{ui_element_opened element="ap_calls_list_widget_opened"}] %}
<table id="admin_portal_call_history_table" class="table display table-striped table-condensed">
  <thead>
    <tr>
      <th style="text-align: center;">{_ Date _}</th>
      <th style="text-align: center;">{_ From _}</th>
      <th style="text-align: center;">{_ To _}</th>
      <th style="text-align: center;">{_ Duration _}</th>
      <th style="text-align: center;"></th>
      <th style="text-align: center;"></th>
    </tr>
  </thead>
  <tbody>
    {% with m.kazoo.get_user_timezone as user_timezone %}
      {% for call in calls %}
          {% include "admin_cdr_table_line.tpl" call=call[1] timezone=user_timezone %}
      {% endfor %}
    {% endwith %}
  </tbody>
</table>

{% javascript %}
//var initSearchParam = $.getURLParam("filter");
var oTable = $('#admin_portal_call_history_table').dataTable({
"pagingType": "simple",
"bFilter" : true,
"aaSorting": [[ 0, "desc" ]],
"aLengthMenu" : [[5, 15, -1], [5, 15, "All"]],
"iDisplayLength" : 5,
"oLanguage" : {
        "sInfoThousands" : " ",
        "sLengthMenu" : "_MENU_ {_ lines per page _}",
        "sSearch" : "{_ Filter _}:",
        "sZeroRecords" : "{_ Nothing found, sorry _}",
        "sInfo" : "{_ Showing _} _START_ {_ to _} _END_ {_ of _} _TOTAL_ {_ entries _}",
        "sInfoEmpty" : "{_ Showing 0 entries _}",
        "sInfoFiltered" : "({_ Filtered from _} _MAX_ {_ entries _})",
        "oPaginate" : {
                "sPrevious" : "{_ Back _}",
                "sNext" : "{_ Forward _}"
        }
},

});
{% endjavascript %}
{% endif %}

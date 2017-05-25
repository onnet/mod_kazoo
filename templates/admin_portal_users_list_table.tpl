{% if m.kazoo[{ui_element_opened element="ap_users_widget_opened"}] %}
<table id="admin_portal_users_table" class="table display table-striped table-condensed">
  <thead>
    <tr>
      <th style="text-align: center1;">{_ Username _}</th>
      <th style="text-align: center;">{_ First Name _}</th>
      <th style="text-align: center;">{_ Last Name _}</th>
      <th style="text-align: center;">{_ Privilege _}</th>
      <th style="text-align: center;">{_ CID Number _}</th>
      <th style="text-align: center;"></th>
      <th style="text-align: center;"></th>
    </tr>
  </thead>
  <tbody>
    {% for user in m.kazoo.kz_list_account_users %}
    {% with m.kazoo[{kz_user_doc_by_ownerid owner_id=user[1]["id"]}] as user_doc %}
    {% with user_doc[1]["caller_id"][1]["internal"][1]["number"],
            user_doc[1]["caller_id"][1]["external"][1]["number"]
         as
            internal_cid,
            external_cid
    %} 
    <tr>
      <td style="text-align: left;">{{ user[1]["username"] }}</td>
      <td style="text-align: center;">{{ user[1]["first_name"]|truncate:13 }}</td>
      <td style="text-align: center;">{{ user[1]["last_name"]|truncate:13 }}</td>
      <td style="text-align: center;">{{ user[1]["priv_level"] }}</td>
      <td style="text-align: center;">
          {{ internal_cid }}
          {% if internal_cid and external_cid %} | {% endif %}
          {{ external_cid }}
      </td>
      <td style="text-align: center;">
        {% if user_doc[1]["enabled"] %}
          <i class="fa fa-check zprimary" title="{_ Enabled _}"></i>
        {% else %}
          <i class="fa fa-remove zalarm" title="{_ Disabled _}"></i>
        {% endif %}
      </td>
      <td style="text-align: center;">
        <i id="info_{{ user[1]["id"] }}" class="fa fa-edit pointer" title="{_ Edit _}"></i>
      </td>
      {% wire id="info_"++user[1]["id"]
              action={dialog_open title=_"Edit user"++" "++user[1]["username"]
                                  template="_edit_user_lazy.tpl"
                                  user_id=user[1]["id"]
                                  width="auto"
                     }
      %}
    </tr>
    {% endwith %}
    {% endwith %}
    {% endfor %}
  </tbody>
</table>

{% javascript %}
var oTable = $('#admin_portal_users_table').dataTable({
"pagingType": "simple",
"bFilter" : true,
"aaSorting": [[ 3, "desc" ]],
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
"columnDefs": [
            {
                "targets": [ 1,2 ],
                "visible": false
            }
],

});
{% endjavascript %}
{% endif %}

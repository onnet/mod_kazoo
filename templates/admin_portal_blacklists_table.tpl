{% if m.kazoo[{ui_element_opened element="ap_blacklists_widget_opened"}] %}
{% with m.kazoo[{kz_doc_field type="account" doc_id=" " field="blacklists"}] as blacklists %}
<table id="admin_portal_blacklists_table" class="table display table-striped table-condensed">
  <thead>
    <tr>
      <th style="text-align: center;"></th>
      <th style="text-align: center1;">
        {_ Blacklist Name _}
      </th>
      <th style="text-align: center;"></th>
      <th style="text-align: center;"></th>
    </tr>
  </thead>
  <tbody>
    {% for blacklist in m.kazoo.kz_list_account_blacklists %}
      <tr>
        <td style="text-align: center;">
          {% if blacklist[1]["id"]|member:blacklists %}
            <i id="toggle_bl_member_{{ blacklist[1]["id"] }}"
               class="fa fa-toggle-on pointer"
               title="Active"></i>
          {% else %}
            <i id="toggle_bl_member_{{ blacklist[1]["id"] }}"
               class="fa fa-toggle-off pointer"
               title="Deactivated"></i>
          {% endif %}
          {% wire id="toggle_bl_member_"++blacklist[1]["id"]
                  action={confirm text=_"Do you really want to proceed?"
                                  action={postback postback={toggle_blacklist_member
                                                             blacklist_id=blacklist[1]["id"]
                                                            }
                                                   delegate="mod_kazoo"
                                         }
                         }
          %}
        </td>
        <td style="text-align: center1;">{{ blacklist[1]["name"] }}</td>
        <td style="text-align: center;">
          <i id="edit_{{ blacklist[1]["id"] }}"
             class="fa fa-edit pointer"
             title="{_ Edit _}"></i></td>
          {% wire id="edit_"++blacklist[1]["id"]
                  action={dialog_open title=_"Edit blacklist"++" "++blacklist[1]["name"]
                                      template="_edit_blacklist_lazy.tpl"
                                      blacklist_id=blacklist[1]["id"]
                         }
          %}
        <td style="text-align: center;">
          <i id="delete_{{ blacklist[1]["id"] }}"
             class="fa fa-trash-o pointer"
             title="{_ Delete _}"></i>
          {% wire id="delete_"++blacklist[1]["id"]
                  action={confirm text=_"Do you really want to delete blacklist "
                                         ++ blacklist[1]["name"]
                                         ++ "?"
                                  action={postback postback={delete_blacklist
                                                             blacklist_id=blacklist[1]["id"]
                                                            }
                                                   delegate="mod_kazoo"
                                         }
                         }
          %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
{% endwith %}

{% javascript %}
var oTable = $('#admin_portal_blacklists_table').dataTable({
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
  "columnDefs": [
  ]
});
{% endjavascript %}
{% endif %}

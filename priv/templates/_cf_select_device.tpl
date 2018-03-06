{% with m.kazoo[{cf_get_element_by_id element_id=element_id}] as element_data %}
{% wire id="form_cf_select_device"
        type="submit"
        postback="cf_select_device"
        delegate="mod_kazoo"
%}
<form id="form_cf_select_device" method="post" action="postback">
  <div class="form-group">
    <div class="row">
      <div class="col-sm-6">
          <select id="device_selector"
                  name="selected"
                  class="form-control margin-bottom-xs"
                  style="text-align:center;"
                  data-live-search="true">
            {% for option in m.kazoo.kz_list_account_devices_short %}
              {% if option[1] %}
                <option value="{{ option[1] }}"
                        {% if option[1] == kz_element_id %}
                          selected
                        {% endif %}>
                  {{ option[2] }}
                </option>
              {% endif %}
            {% endfor %}
          </select>
      </div>
      <div id="number_input_div"class="col-sm-6">
        {_ Ring this device for _}
        <input type="text"
               name="timeout"
               id="parameter_input"
               maxlength="3"
               size="3"
               style="height: 34px; text-align: center;"
               value="{% if element_data[1]["data"][1]["timeout"] %}{{ element_data[1]["data"][1]["timeout"] }}{% else %}20{% endif %}">
        {_ seconds _}.
      </div>
    </div>
  </div>
  <input type="hidden" name="element_id" value="{{ element_id }}">
</form>
<div class="form-group">
  <div class="row">
    <div class="col-sm-6">
      {% wire id="button_cf_select_device_create"
              action={dialog_open title=_"Add device"
                                  template="_add_device_dialog.tpl"
                     }
      %}
      <button id="button_cf_select_device_create"
              class="col-xs-12 btn btn-zprimary margin-bottom-xs">
        {_ Add device _}
      </button>
    </div>
    {% wire name="refresh_edit_device_btn_cf_device"
            action={update target="edit_device_btn_cf_device"
                           template="_cf_edit_device_button.tpl"
                   }
    %}
    <div id="edit_device_btn_cf_device" class="col-sm-6">
      {% if kz_element_id %}
        {% wire id="button_cf_select_device_edit"
                action={dialog_open title=_"Edit device"++" "++kz_element_name
                                    template="_edit_device_lazy.tpl"
                                    device_id=kz_element_id
                                    width="auto"
                       }
        %}
        <button id="button_cf_select_device_edit"
                class="col-xs-12 btn btn-zprimary margin-bottom-xs">
          {_ Edit device _}
        </button>
      {% endif %}
    </div>
  </div>
</div>
<div class="form-group">
  <div class="row">
    <div class="col-sm-12">
      <button id="button_cf_select_device"
              class="col-xs-12 btn btn-zprimary margin-bottom-xs">
        {_ Save _}
      </button>
    </div>
  </div>
</div>
{% wire id="button_cf_select_device"
        action={script script="$('#"++element_id++"_details').text(($('#device_selector option:selected').text()))"}
        action={submit target="form_cf_select_device"}
%}
{% endwith %}
{% javascript %}
    $('.modal-header h3').append($('#{{ tool_name }}  div.tool_name').text());
    $('#device_selector').selectpicker({size: 5});
    $(function() {
        $('#device_selector').on('change', function(){
          var selected = $(this).find("option:selected").val();
          var selected_name = $(this).find("option:selected").text();
          z_event("refresh_edit_device_btn_cf_device", { kz_element_id: selected, kz_element_name: selected_name });
        });
    });
{% endjavascript %}

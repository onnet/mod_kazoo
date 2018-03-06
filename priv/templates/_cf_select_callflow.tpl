{% wire id="form_cf_select_callflow"
        type="submit"
        postback="cf_select_callflow"
        delegate="mod_kazoo"
%}
<form id="form_cf_select_callflow" method="post" action="postback">
  <div class="form-group">
    <div class="row">
      <div class="col-sm-12">
        <select id="callflow_selector"
                name="selected"
                class="form-control margin-bottom-xs"
                style="text-align:center;">
          {% for option in m.kazoo.kz_list_account_callflows %}
            {% if option[1]["numbers"][1]|match:"^\\+?\\d+$" %}
              <option value="{{ option[1]["id"] }}"
                      {% if option[1]["id"]==kz_element_id %}
                        selected="selected"
                      {% endif %}>
                {% if option[1]["name"] %}
                  {{ option[1]["name"] }}
                {% else %}
                  {{ option[1]["numbers"][1] }}
                {% endif %}
              </option>
            {% endif %}
          {% endfor %}
        </select>
      </div>
    </div>
  </div>
  <input type="hidden" name="element_id" value="{{ element_id }}">
</form>
<div class="form-group">
  <div class="row">
    <div class="col-sm-12">
      <button id="button_cf_select_callflow"
              class="col-xs-12 btn btn-zprimary margin-bottom-xs">
        {_ Save _}
      </button>
    </div>
  </div>
</div>
{% wire id="button_cf_select_callflow"
        action={script script="$('#"++element_id++"_details').text(($('#callflow_selector option:selected').text()))"}
        action={submit target="form_cf_select_callflow"}
%}
{% javascript %}
  $('.modal-header h3').append($('#{{ tool_name }}  div.tool_name').text());
{% endjavascript %}

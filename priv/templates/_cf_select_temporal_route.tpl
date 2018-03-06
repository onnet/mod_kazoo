{% with m.kazoo[{cf_get_module_info module_name=tool_name module_path=element_id}][2] as current_timezone %}
{% wire id="form_cf_select_temporal_route" type="submit" postback="cf_select_temporal_route" delegate="mod_kazoo" %}
<form id="form_cf_select_temporal_route" method="post" action="postback">
    <div class="form-group">
      <div class="row">
        <div class="col-sm-12">
            <select id="temporal_route_selector" name="selected" class="form-control margin-bottom-xs" style="text-align:center;" data-live-search="true">
              {% for zone in m.kazoo.tz_list %}
                  <option value="{{ zone }}" {% if zone == current_timezone %}selected{% endif %}>{{ zone }}</option>
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
      <button id="button_cf_select_temporal_route" class="col-xs-12 btn btn-zprimary margin-bottom-xs">{_ Save _}</button>
    </div>
  </div>
</div>
{% endwith %}
{% wire id="button_cf_select_temporal_route" action={script script="$('#"++element_id++"_details').text(($('#temporal_route_selector option:selected').text()))"}
                                  action={submit target="form_cf_select_temporal_route"}
%}
{% javascript %}
    $('.modal-header h3').text("{_ Select timezone _}");
    $('#temporal_route_selector').selectpicker({size: 5});
{% endjavascript %}

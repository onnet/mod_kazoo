<div class="row" style="margin-top: 2em; margin-bottom: 1em;">
  <div class="col-xs-4 col-xs-offset-3">
    {% wire id="child_selector" type="change" action={postback postback="rs_child_selected" delegate="mod_kazoo"} %}
    <select id="child_selector" name="selected" class="col-xs-12 form-control margin-bottom-xs selectpicker" style="text-align:center;display: none;" data-live-search="true">
      <option value="">-- {_ Select account to edit _} --</option>
      <option value="new">-- {_ Create new account _} --</option>
      {% for option in m.kazoo.kz_list_account_children %}
          <option value="{{ option["id"] }}">
            {{ option["name"] }} - {{ option["realm"] }}
          </option>
      {% endfor %}
    </select>
  </div>
  {% javascript %}
    $('#child_selector').selectpicker({
      style: 'btn-zalarm',
      size: 7
    });
  {% endjavascript %}
  {% wire id="create_account_btn" action={ dialog_open title=_"Create an account" template="_rs_add_account.tpl" } %}
  <div class="col-xs-2">
    <button id="create_account_btn" class="col-xs-12 btn btn-zprimary margin-bottom-xs">{_ Create _}</button>
  </div>
</div>

<div id="child_sandbox" class="row">
{% if account_id %}
  {% include "reseller_child_info.tpl" %}
{% endif %}
</div>
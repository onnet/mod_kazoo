<div class="row">
  <br />
  <div class="col-sm-10">
  <!-- Device Nickname field -->
  <div class="row">
    <div class="col-xs-5">
      <label class="edit_user_label">
        {_ Device Nickname _}
      </label>
    </div>
    <div id="name" class="col-xs-5">
      {% include "_show_field.tpl" type="device"
                                   doc_id=device_id
                                   field_name=["name"]
      %}
    </div>
  </div>

  <!-- Device status -->
  <div class="row">
    <div class="col-xs-5">
      <label class="edit_user_label">
        {_ Device status _}
      </label>
    </div>
    <div id="device_enabled_status" class="col-xs-5">
      {% if device_doc["enabled"] %}
        <span class="zprimary">
          {_ Enabled _}
        </span>
      {% else %}
        <span class="zalarm">
          {_ Disabled _}
        </span>
      {% endif %}
    </div>
  </div>

    <!-- Assign To -->
    <div class="row">
      <div class="col-xs-5"><label class="edit_user_label">{_ Assign To _}</label></div>
      <div id="owner_id" class="col-xs-5">
        {% wire id="edit_owner_id"
                type="click"
                action={update target="owner_id"
                               template="_edit_field_select.tpl"
                               type="device"
                               doc_id=device_id
                               field_name="owner_id"
                               options=m.kazoo.kz_list_account_users_short
                       }
        %}
        <span>
          {{ m.kazoo[{kz_doc_field type="user" doc_id=device_doc["owner_id"] field="first_name"}] }}
          {{ m.kazoo[{kz_doc_field type="user" doc_id=device_doc["owner_id"] field="last_name"}] }}
          <i id="edit_owner_id" class="fa fa-edit pointer" title="Edit field"></i>
        </span>
      </div>
    </div>

  <!-- SIP URI field -->
  <div class="row">
    <div class="col-xs-5">
      <label class="edit_user_label">
        {_ SIP URI _}
      </label>
    </div>
    <div id="siproute" class="col-xs-5">
        {% wire id="edit_siproute"
                type="click"
                action={update target="siproute"
                               template="_edit_field.tpl"
                               type="device"
                               doc_id=device_id
                               field_name=["sip","route"]
                               placeholder="sip:support@company.com"
                       }
        %}
        <span>
            {{ device_doc["sip"][1]["route"] }}
            <i id="edit_siproute"
               class="fa fa-edit pointer"
               title="Edit field"></i>
        </span>
    </div>
  </div>


  {% if device_doc["sip"][1]["method"] == "ip" %}

  <!-- SIP IP Auth field -->
  <div class="row">
    <div class="col-xs-5">
      <label class="edit_user_label">
        {_ IP Auth _}
      </label>
    </div>
    <div id="sipip" class="col-xs-5">
        {% wire id="edit_sipip"
                type="click"
                action={update target="sipip"
                               template="_edit_field.tpl"
                               type="device"
                               doc_id=device_id
                               field_name=["sip","ip"]
                               placeholder="1.2.3.4"
                       }
        %}
        <span>
            {{ device_doc["sip"][1]["ip"] }}
            <i id="edit_sipip"
               class="fa fa-edit pointer"
               title="Edit field"></i>
        </span>
    </div>
  </div>

  {% endif %}

  <br />
  </div>
  <div class="col-xs-2" id="device_enable_control">
    {% if device_doc["enabled"] %}
        <div>
            {% button class="col-xs-12 btn btn-zalarm mb-1 long-text" text=_"Disable"
                      action={postback postback={disable_doc type doc_id field_name}
                                       inject_args type="device" doc_id=device_id field_name="enabled"
                                       delegate="mod_kazoo"
                             }
            %}
        </div>
    {% else %}
        <div>
            {% button class="col-xs-12 btn btn-zprimary mb-1 long-text" text=_"Enable"
                      action={postback postback={enable_doc type doc_id field_name}
                                       inject_args type="device" doc_id=device_id field_name="enabled"
                                       delegate="mod_kazoo"
                             }
            %}
        </div>
    {% endif %}
  </div>
  <div class="col-xs-2">
    <div>
        {% button class="col-xs-12 btn btn-zalarm mb-1"
                  text=_"Delete"
                  action={confirm text="Do you really want to delete this device?"
                                  action={ postback postback={delete_device device_id}
                                                    inject_args device_id=device_id delegate="mod_kazoo"}
                                  action={dialog_close}
                         }
        %}
    </div>
  </div>
  <div class="col-xs-2">
    <div>
      {% button class="col-xs-12 btn btn-zprimary mb-1"
         text=_"Close"
         action={dialog_close}
      %}
    </div>
  </div>
</div>


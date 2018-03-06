<div class="row">
  <br />
  <div class="col-sm-12">
    <div class="row">
        {% wire id="delete_allotment_"++allotment[1]
                action={hide target="delete_allotment_"++allotment[1]}
                action={show target="cancel_delete_allotment_"++allotment[1]}
                action={show target="confirm_delete_allotment_"++allotment[1]}
        %}
        {% wire id="cancel_delete_allotment_"++allotment[1]
                action={show target="delete_allotment_"++allotment[1]}
                action={hide target="cancel_delete_allotment_"++allotment[1]}
                action={hide target="confirm_delete_allotment_"++allotment[1]}
        %}
        {% wire id="confirm_delete_allotment_"++allotment[1]
                action={postback postback={delete_allotment_element account_id=account_id allotment_element_name=allotment[1]} delegate="mod_kazoo"}
        %}
        <div class="col-xs-6">
          <i id="delete_allotment_{{ allotment[1] }}" class="fa fa-remove pointer" title="Remove"></i>
          <i id="cancel_delete_allotment_{{ allotment[1] }}" style="display: none;" class="fa fa-reply pointer" title="Cancel"></i>
          <i id="confirm_delete_allotment_{{ allotment[1] }}" style="display: none;" class="fa fa-trash-o pointer" title="Confirm delete"></i>
          <label class="allotment_label">{{ allotment[1] }}</label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ Amount _}</label></div>
        <div id="allotment_{{ allotment[1] }}_amount" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_amount"
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_amount"
                                 template="_edit_allotment_field.tpl"
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name="amount"
                         }
          %}
          {{ allotment[2][1]["amount"] }}
          <i id="edit_{{ allotment[1] }}_amount" class="fa fa-edit pointer" title="Edit amount"></i>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ Cycle _}</label></div>
        {% with "cycle" as field_name %}
        <div id="allotment_{{ allotment[1] }}_{{ field_name }}" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_"++field_name
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_"++field_name
                                 template="_edit_allotment_field_select.tpl"
                                 options=["monthly","weekly","daily","hourly"]
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name=field_name
                         }
          %}
          {{ allotment[2][1][field_name] }}
          <i id="edit_{{ allotment[1] }}_{{ field_name }}" class="fa fa-edit pointer" title="Edit {{ field_name }}"></i>
        </div>
        {% endwith %}
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ Increment _}</label></div>
        {% with "increment" as field_name %}
        <div id="allotment_{{ allotment[1] }}_{{ field_name }}" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_"++field_name
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_"++field_name
                                 template="_edit_allotment_field.tpl"
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name=field_name
                         }
          %}
          {{ allotment[2][1][field_name] }}
          <i id="edit_{{ allotment[1] }}_{{ field_name }}" class="fa fa-edit pointer" title="Edit {{ field_name }}"></i>
        </div>
        {% endwith %}
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ Minimum _}</label></div>
        {% with "minimum" as field_name %}
        <div id="allotment_{{ allotment[1] }}_{{ field_name }}" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_"++field_name
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_"++field_name
                                 template="_edit_allotment_field.tpl"
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name=field_name
                         }
          %}
          {{ allotment[2][1][field_name] }}
          <i id="edit_{{ allotment[1] }}_{{ field_name }}" class="fa fa-edit pointer" title="Edit {{ field_name }}"></i>
        </div>
        {% endwith %}
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ No consume time _}</label></div>
        {% with "no_consume_time" as field_name %}
        <div id="allotment_{{ allotment[1] }}_{{ field_name }}" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_"++field_name
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_"++field_name
                                 template="_edit_allotment_field.tpl"
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name=field_name
                         }
          %}
          {{ allotment[2][1][field_name] }}
          <i id="edit_{{ allotment[1] }}_{{ field_name }}" class="fa fa-edit pointer" title="Edit {{ field_name }}"></i>
        </div>
        {% endwith %}
    </div>
    <div class="row">
        <div class="col-xs-6"><label class="edit_user_label">{_ Group consume _}</label></div>
        {% with "group_consume" as field_name %}
        <div id="allotment_{{ allotment[1] }}_{{ field_name }}" class="col-xs-5">
          {% wire id="edit_"++allotment[1]++"_"++field_name
                  type="click"
                  action={update target="allotment_"++allotment[1]++"_"++field_name
                                 template="_edit_allotment_field.tpl"
                                 account_id=account_id
                                 allotment_name=allotment[1]
                                 field_name=field_name
                         }
          %}
          {{ allotment[2][1][field_name] }}
          <i id="edit_{{ allotment[1] }}_{{ field_name }}" class="fa fa-edit pointer" title="Edit {{ field_name }}"></i>
        </div>
        {% endwith %}
    </div>
  </div>
</div>


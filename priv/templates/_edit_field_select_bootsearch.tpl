<select id="{{ field_name }}_input"
        name="input_value"
        class="btn-xs btn-onnet"
        style="max-width:140px; height:20px; text-align:center;"
        data-live-search="true"
        data-width="auto">
  {% with m.kazoo[{kz_doc_field type=type doc_id=doc_id field=field_name account_id=account_id}]
     as
     current_value
  %}
    {% for option in options %}
      {% if option|is_list %}
        <option value="{{ option[1] }}" {% if option[1] == current_value %}selected{% endif %}>
          {{ option[2]|vartrans }}
        </option>
      {% else %}
        <option value="{{ option }}" {% if option == current_value %}selected{% endif %}>
          {{ option|vartrans }}
        </option>
      {% endif %}
    {% endfor %}
  {% endwith %}
</select>

<i id="{{ field_name }}_undo" class="fa fa-remove pointer" title="Cancel"></i>
{% wire id=field_name++"_undo"
        type="click"
        action={update target=prefix++field_name
                       template="_show_field_select.tpl"
                       type=type
                       doc_id=doc_id
                       account_id=account_id
                       field_name=field_name
                       options=options
                       convert_macro=convert_macro
                       prefix=prefix
                       postfix=postfix}
%}
<i id="{{ field_name }}_save" class="fa fa-save pointer" title="{_ Save _}"></i>
{% wire id=field_name++"_save"
        type="click"
        action={postback postback={save_field_select type doc_id field_name options prefix postfix account_id convert_macro} 
                         delegate="mod_kazoo" 
                         qarg=field_name++"_input"
                         inject_args type=type
                                     doc_id=doc_id
                                     field_name=field_name
                                     options=options
                                     prefix=prefix
                                     postfix=postfix
                                     account_id=account_id
                                     convert_macro=convert_macro
               }
%}

{% javascript %}
    $('#{{ field_name }}_input').selectpicker({
      style: 'btn-xs btn-onnet',
      size: 5
    });
{% endjavascript %}

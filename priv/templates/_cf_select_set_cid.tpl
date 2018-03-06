{% wire id="form_cf_select_set_cid" type="submit" postback="cf_select_set_cid" delegate="mod_kazoo" %}
<form id="form_cf_select_set_cid" method="post" action="postback">
    <div class="form-group">
      <div class="row">
        <div class="col-sm-6">
          <input type="text" class="form-control margin-bottom-xs" id="caller_id_name" name="caller_id_name" placeholder="Caller-ID Name" value="{{ kz_element_name[1] }}">
        </div>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="caller_id_number" name="caller_id_number" placeholder="Caller-ID Number" value="{{ kz_element_name[2] }}">
        </div>
      </div>
    </div>
    <input type="hidden" name="element_id" value="{{ element_id }}">
</form>
<div class="form-group">
  <div class="row">
    <div class="col-sm-12">
      <button id="button_cf_select_set_cid" class="col-xs-12 btn btn-zprimary margin-bottom-xs">{_ Save _}</button>
    </div>
  </div>
</div>
{% wire id="button_cf_select_set_cid" action={script script="$('#"++element_id++"_details').text($('#caller_id_name').val()+' '+$('#caller_id_number').val())"}
                                  action={submit target="form_cf_select_set_cid"}
%}
{% javascript %}
    $('.modal-header h3').append($('#{{ tool_name }}  div.tool_name').text());
{% endjavascript %}

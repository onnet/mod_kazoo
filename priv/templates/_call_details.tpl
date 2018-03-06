<div class="row">
  {% with  m.kazoo[{kz_fetch_cdr_details cdr_id=cdr_id}] as call_doc %}
  <div class="col-sm-8" style="text-align: center;">
    {_ Call _}: 
    {% if call_doc[1]["caller_id_number"]|slice:[-2,] == call_doc[1]["caller_id_name"]|slice:[-2,] %}
      {{ call_doc[1]["caller_id_number"] }}
    {% else %}
      {{ call_doc[1]["caller_id_name"] }} ({{ call_doc[1]["caller_id_number"] }})
    {% endif %}
    <i class="fa fa-long-arrow-right"></i>
    {{ call_doc[1]["to"]|split:"@"|first }} 
    {% if call_doc[1]["callee_id_number"] %}
      {% if call_doc[1]["to"]|split:"@"|first|slice:[-2,] != call_doc[1]["callee_id_number"]|slice:[-2,] %}
        ({{ call_doc[1]["callee_id_number"] }})
      {% endif %}
    {% endif %}
  </div>
  <div class="col-sm-4" style="text-align: left;">
    {_ Duration _}: 
    {{ call_doc[1]["duration_seconds"] }}/{{ call_doc[1]["billing_seconds"] }} 
    {_ sec. _} 
  </div>
  <div class="col-sm-12" style="margin-top: 1em;">
    {% print call_doc %}
  </div>
  {% endwith %}
</div>

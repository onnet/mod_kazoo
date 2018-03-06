<br />
{% with m.kazoo[{notifications_smtplog_by_id notifications_smtplog_id=notification_id}] as log_message %}
  <div class="form-group">
    <div class="row">
      <div class="col-sm-12">
        <div style="border-radius: 0" class="panel panel-info">
          <div class="panel-heading">
            <strong>{_ Date _}:</strong>
            {{ notification_created|gregsec_to_date|date:"Y-m-d H:i T":m.kazoo.get_user_timezone }}
            <br />
            <strong>{_ From _}:</strong>
            {{ log_message[1]["emails"][1]["from"] }}
            <br />
            <strong>{_ To _}:</strong>
            {% for email_address in log_message[1]["emails"][1]["to"] %}
              {{ email_address }}{% if not forloop.last %}, {% endif %}
            {% endfor %}
            <br />
            <strong>{_ Subject _}:</strong>
            {{ log_message[1]["subject"] }}
          </div>
          <div class="panel-body">
            {{ log_message[1]["rendered_templates"][1]["text/html"] }}
          </div>
          <div class="panel-heading">
            <strong>{_ Receipt _}:</strong>
            {{ log_message[1]["receipt"] }}
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="row">
      <div class="col-sm-12">
        {% button text=_"Close" class="col-xs-12 btn btn-zprimary margin-bottom-xs" action={dialog_close} %}
      </div>
    </div>
  </div>
{% endwith %}

{% extends "dashboard_base.tpl" %}

{% block header_title %}
  {% include "_account_page_title.tpl" title=_"Operations" %}
{% endblock %}

{% block service_description %}

<div class="pl-10 pr-10 col-md-6">
  <span id="tasks_widget_tpl">
    {% include "tasks_widget.tpl" headline=_"Background jobs" %}
  </span>
</div>
<div class="pl-10 pr-10 col-md-6">
  {% include "operations_account_lookup.tpl" headline=_"Accounts management" %}
</div>

{% endblock %}

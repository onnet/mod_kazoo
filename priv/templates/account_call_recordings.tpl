{% extends "dashboard_base.tpl" %}

{% block header_title %}
  {% include "_account_page_title.tpl" title=_"Account call recordings" %}
{% endblock %}

{% block service_description %}

<div class="pl-10 pr-10 col-md-12">
  <span id="admin_portal_call_recordings_tpl">
    {% include "admin_portal_call_recordings.tpl" headline=_"Recordings list" %}
  </span>
</div>

{% endblock %}

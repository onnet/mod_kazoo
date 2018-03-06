{% extends "dashboard_base.tpl" %}

{% block header_title %}
  {% include "_account_page_title.tpl" title=_"Callflow Builder " %}
{% endblock %}


{% block service_description %}

{% include "cf_app_style.tpl" %}
{% lib "css/kazoo/cf_tables.css" %}
{% lib "css/kazoo/cf_mod_kazoo.css" %}

{% wire action={connect signal={update_cf_builder_area signal_filter=m.kazoo.signal_filter}
        action={update target="cf_builder_area" template="kzui_cf.tpl"}}
%}
<span id="cf_builder_area">
  {% include "kzui_cf.tpl" %}
</span>

{% javascript %}
  $(function () {
    $('[data-toggle="popover"]').popover()
  });
{% endjavascript %}

{% endblock %}


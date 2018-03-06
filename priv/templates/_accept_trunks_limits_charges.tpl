<div class="form-group">
  <div class="row" style="font-size: 1.15em;">
    <div class="col-sm-10 col-sm-offset-1">

      {% if quantity_diff > 0 %}
        <p style="font-size: 1.5em; margin-bottom: 0.5em;"><strong>Dear customer,</strong></p>
        <p>
           You are about to purchase <strong class="zalarm">{{ quantity_diff }}</strong>
           unit(s) of <strong class="zalarm">{{ item[1]["name"] }}</strong> service.
        </p>
        <p>Activation charge:</p>
        <p>
          <strong>
            {{ quantity_diff }} x {{ item[1]["activation_charge"]|currency_sign }}
            =
            <span class="zalarm">{{ (quantity_diff * item[1]["activation_charge"])|currency_sign }}</span>
          </strong>
        </p>
        <p>Your monthly expenses will be increased by:</p>
        <p>
          <strong>
            {{ quantity_diff }} x {{ item[1]["rate"]|currency_sign }}
            =
            <span class="zalarm">{{ (quantity_diff * item[1]["rate"])|currency_sign }}</span>
          </strong>
        </p>
        <p>Your {{ item[1]["name"] }} monthly charges after this purchase will be:</p>
        <p>
          <strong>
            {{ item[1]["quantity"] }} x {{ item[1]["rate"]|currency_sign }}
             -
            {{
              (item[1]["single_discount_rate"] - item[1]["cumulative_discount"] * item[1]["cumulative_discount_rate"])
              |currency_sign
            }}
             =
            <span class="zalarm"> 
              {{
                (item[1]["quantity"] * item[1]["rate"]
                 - (item[1]["single_discount_rate"] - item[1]["cumulative_discount"] * item[1]["cumulative_discount_rate"])
                )|currency_sign
              }}
            </span>
          </strong>
        </p>
        <p>Your account will be charged immediately after this purchase.</p>
        <p>Charges will be pro-rated for your billing cycle.</p>
      {% else %}

        <p style="font-size: 1.4em; margin-top: 1em; text-align: center;">
          Please confirm you would like to decrease amount of
          <br />
          <span class="zalarm" style="font-size: 1.3em; margin-bottom1: 2em; text-align: center;">
            <strong>{{ item[1]["name"] }}</strong>
          </span>
          items.
        </p>

      {% endif %}
      <br />
      <input type="hidden" id="input_value" name="input_value" value="{{ trunks_type }}">
      <input type="hidden" id="accept_charges" name="accept_charges" value="true">
      <div class="form-group">
        <div class="row">
          <div class="col-sm-6">
            {% button id="confirm_trunks_payment" class="col-xs-12 btn btn-zalarm margin-bottom-xs" text=_"Confirm" %}
            {% wire id="confirm_trunks_payment"
                    type="click"
                    action={postback postback={save_trunks_limits trunks_type account_id}
                                     delegate="mod_kazoo"
                                     qarg=trunks_type++"_manager_input"
                                     qarg="accept_charges"
                                     inject_args trunks_type=trunks_type account_id=account_id
                           }
                    action={dialog_close}
            %}

          </div>
          <div class="col-sm-6">
            {% button class="col-xs-12 btn btn-zprimary margin-bottom-xs" text=_"Cancel" action={dialog_close} %}
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


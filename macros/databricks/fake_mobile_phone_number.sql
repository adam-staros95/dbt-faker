{% macro databricks__fake_mobile_phone_number(seed_column, locale='en_US') %}
    {% if locale == 'en_US' %}
        concat(
            '(',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=800, width=3, offset=200) }},
            ') ',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=800, width=3, suffix='_mid', offset=200) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=10000, width=4, suffix='_end') }}
        )
    {% elif locale == 'pl_PL' %}
        concat(
            '+48 ',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=500, width=3, offset=500) }},
            ' ',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000, width=3, suffix='_mid') }},
            ' ',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000, width=3, suffix='_end') }}
        )
    {% endif %}
{% endmacro %}

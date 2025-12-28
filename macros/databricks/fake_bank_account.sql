{% macro databricks__fake_bank_account(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'PL',
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000000, width=9) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000000, width=9, suffix='1') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=1000000, width=6, suffix='2') }}
        )
    {% elif locale == 'en_US' %}
        {{ dbt_faker.databricks__random_digit_string(seed_column=seed_column, range=9999999999, width=10) }}
    {% endif %}
{% endmacro %}

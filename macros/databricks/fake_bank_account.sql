{% macro databricks__fake_bank_account(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'PL',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000000, 9) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000000, 9, '1') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000000, 6, '2') }}
        )
    {% elif locale == 'en_US' %}
        {{ dbt_faker.databricks__random_digit_string(seed_column, 9999999999, 10) }}
    {% endif %}
{% endmacro %}

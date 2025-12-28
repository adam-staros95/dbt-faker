{% macro databricks__fake_landline_fax_number(seed_column, locale='en_US') %}
    {% if locale == 'en_US' %}
        concat(
            '(',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 800, 3, offset=200) }},
            ') ',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 800, 3, '_mid', 200) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_end') }}
        )
    {% elif locale == 'pl_PL' %}
        concat(
            '+48 ',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 90, 2, offset=10) }},
            ' ',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000, 3, '_mid') }},
            ' ',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 1000, 3, '_end') }},
            ' ',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 100, 2, '_end2') }}
        )
    {% endif %}
{% endmacro %}

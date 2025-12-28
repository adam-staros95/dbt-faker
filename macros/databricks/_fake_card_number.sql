{% macro databricks__fake_card_number(seed_column, formatted=true) %}
    {% if formatted %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part1') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part2') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part3') }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part4') }}
        )
    {% else %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part1') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part2') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part3') }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_part4') }}
        )
    {% endif %}
{% endmacro %}

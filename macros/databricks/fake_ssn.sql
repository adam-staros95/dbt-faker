{% macro databricks__fake_ssn(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            {{ dbt_faker.databricks__random_digit_string(seed_column, 100, 2) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 12, 2, '_month', 1) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 28, 2, '_day', 1) }},
            {{ dbt_faker.databricks__random_digit_string(seed_column, 10000, 4, '_seq') }},
            cast(
                {{ dbt_faker.databricks__hash_mod(seed_column, 10, '_check') }}
                as string
            )
        )
    {% elif locale == 'en_US' %}
        concat(
            case
                when {{ dbt_faker.databricks__hash_mod(seed_column, 899) }} < 665
                then
                    {{ dbt_faker.databricks__random_digit_string(seed_column, 665, 3, offset=1) }}
                else
                    {{ dbt_faker.databricks__random_digit_string(seed_column, 233, 3, '_area', 667) }}
            end,
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 99, 2, '_group', 1) }},
            '-',
            {{ dbt_faker.databricks__random_digit_string(seed_column, 9999, 4, '_serial', 1) }}
        )
    {% endif %}
{% endmacro %}

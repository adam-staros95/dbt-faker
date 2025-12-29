{% macro databricks__fake_full_name(seed_column, locale='en_US') %}
    case
        when {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=3) }} = 0
        then
            concat(
                {{ dbt_faker.fake_first_name(seed_column, locale) }},
                ' ',
                {{ dbt_faker.fake_middle_name(seed_column, locale) }},
                ' ',
                {{ dbt_faker.fake_last_name(seed_column, locale) }}
            )
        else
            concat(
                {{ dbt_faker.fake_first_name(seed_column, locale) }},
                ' ',
                {{ dbt_faker.fake_last_name(seed_column, locale) }}
            )
    end
{% endmacro %}

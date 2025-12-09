{% macro databricks__fake_address(seed_column, locale='en_US') %}
    concat(
        {{ dbt_faker.fake_city(seed_column, locale) }},
        ', ',
        {{ dbt_faker.fake_postal_code(seed_column, locale) }},
        ', ',
        {{ dbt_faker.fake_street(seed_column, locale) }},
        ', ',
        {{ dbt_faker.fake_home_number(seed_column, locale) }}
    )
{% endmacro %}

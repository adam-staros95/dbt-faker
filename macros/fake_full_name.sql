{% macro fake_full_name(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    case
        when mod(abs(hash(cast({{ seed_column }} as string))), 3) = 0
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

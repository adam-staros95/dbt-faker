{% macro databricks__fake_ssn(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            lpad(cast(mod(abs(hash(cast({{ seed_column }} as string))), 100) as string), 2, '0'),
            lpad(cast(1 + mod(abs(hash(cast({{ seed_column }} as string))) / 100, 12) as string), 2, '0'),
            lpad(cast(1 + mod(abs(hash(cast({{ seed_column }} as string))) / 1200, 28) as string), 2, '0'),
            lpad(cast(mod(abs(hash(cast({{ seed_column }} as string))) / 33600, 10000) as string), 4, '0'),
            cast(mod(abs(hash(cast({{ seed_column }} as string))) * 7, 10) as string)
        )
    {% elif locale == 'en_US' %}
        concat(
            case
                when mod(abs(hash(cast({{ seed_column }} as string))), 899) < 665 then
                    lpad(cast(1 + mod(abs(hash(cast({{ seed_column }} as string))), 665) as string), 3, '0')
                else
                    lpad(cast(667 + mod(abs(hash(cast({{ seed_column }} as string))), 233) as string), 3, '0')
            end,
            '-',
            lpad(cast(1 + mod(abs(hash(cast({{ seed_column }} as string))) / 1000, 99) as string), 2, '0'),
            '-',
            lpad(cast(1 + mod(abs(hash(cast({{ seed_column }} as string))) / 100000, 9999) as string), 4, '0')
        )
    {% endif %}
{% endmacro %}


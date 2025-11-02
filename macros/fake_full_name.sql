{% macro fake_full_name(seed_column, locale='en_US') %}
    case
        when mod(abs(hash(cast({{ seed_column }} as string))), 3) = 0 then
            concat(
                {{ fake_first_name(seed_column, locale) }},
                ' ',
                {{ fake_middle_name(seed_column, locale) }},
                ' ',
                {{ fake_last_name(seed_column, locale) }}
            )
        else
            concat(
                {{ fake_first_name(seed_column, locale) }},
                ' ',
                {{ fake_last_name(seed_column, locale) }}
            )
    end
{% endmacro %}



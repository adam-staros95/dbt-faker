{% macro databricks__fake_value_from_map(seed_column, locale_map, locale) %}
    {% set names = locale_map[locale] %}
    {% set quoted_names = [] %}
    {% for name in names %} {% do quoted_names.append("'" ~ name ~ "'") %} {% endfor %}

    element_at(
        array({{ quoted_names | join(', ') }}),
        1 + mod(abs(hash(cast({{ seed_column }} as string))), {{ names | length }})
    )
{% endmacro %}

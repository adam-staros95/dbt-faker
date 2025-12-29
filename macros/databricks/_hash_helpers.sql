{% macro databricks__hash_mod(seed_column, range, suffix=none) %}
    {% if suffix %}
        mod(
            abs(hash(cast(concat({{ seed_column }}, '{{ suffix }}') as string))),
            {{ range }}
        )
    {% else %} mod(abs(hash(cast({{ seed_column }} as string))), {{ range }})
    {% endif %}
{% endmacro %}

{% macro databricks__random_letter(seed_column, suffix=none) %}
    {% set letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'] %}
    {% set quoted_letters = [] %}
    {% for letter in letters %}
        {% do quoted_letters.append("'" ~ letter ~ "'") %}
    {% endfor %}

    element_at(
        array({{ quoted_letters | join(', ') }}),
        1
        + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=26, suffix=suffix) }}
    )
{% endmacro %}

{% macro databricks__random_digit_string(seed_column, range, width, suffix=none, offset=0) %}
    lpad(
        cast(
            {{ offset }}
            + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=range, suffix=suffix) }}
            as string
        ),
        {{ width }},
        '0'
    )
{% endmacro %}
